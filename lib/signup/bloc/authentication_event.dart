part of 'authentication_bloc.dart';


abstract class AuthenticationEvent {}

class UserRegisterEvent extends SigninEvent {
  UserRegisterEvent(
      {required this.name,
      required this.mobileNo,
      required this.email,
      required this.password});
  String name;
  String mobileNo;
  String email;
  String password;
}
