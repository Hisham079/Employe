part of 'authentication_bloc.dart';


abstract class AuthenticationEvent {}

class UserRegisterEvent extends AuthenticationEvent {
  UserRegisterEvent(
      {required this.name,
      required this.mobile_no,
      required this.email,
      required this.password});
  String name;
  String mobile_no;
  String email;
  String password;
}
