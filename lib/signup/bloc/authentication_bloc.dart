import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/userdetailModel.dart';
import '../../signin/bloc/signin_bloc.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<SigninEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SigninEvent>((event, emit) async {
      if (event is UserRegisterEvent) {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        final UserStoring _storing = UserStoring();
        try {
          final user_credential = await _auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);

          UserDetails user = UserDetails(
              email: event.email,
              id: user_credential.user!.uid.toString(),
              mobileno: event.mobileNo,
              name: event.name);
          await _storing.saveUserDetails(user: user);

          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          print(e.code);
          emit(RegisterFailed(error_message: e.code));
        }
      }
    });
  }
}

class UserStoring {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future saveUserDetails({required UserDetails user}) async {
    await _firebaseFirestore
        .collection("usersdetails")
        .doc(_auth.currentUser!.uid)
        .set(user.toJson());
  }
}
