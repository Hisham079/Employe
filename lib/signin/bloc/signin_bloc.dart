import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      if (event is UserLoginEvent) {
        final FirebaseAuth auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSucces());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(error_message: e.code));
        }
      }
    });
  }
}
