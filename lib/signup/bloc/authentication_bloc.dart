import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is UserRegisterEvent) {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        try {
          final user_credential = await _auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          print(e.code);
          emit(RegisterFailed(error_message: e.code));
        }
      }
    });
  }
}
