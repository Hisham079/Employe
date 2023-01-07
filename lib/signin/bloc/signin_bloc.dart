import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      if (event is UserLoginEvent) {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        try {
          await _auth.signInWithEmailAndPassword(
              email: event.email.toString(), password: event.password.toString());
          log(event.email.toString()+"loginsuccess");
          
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          print(e.toString());
            log(event.email.toString()+"loginsuccess");
             log(event.password.toString()+"loginsuccess");
          
          emit(LoginFailed(error_message: e.code));
        }
      }
    });
  }
}
