part of 'signin_bloc.dart';


abstract class SigninEvent {}
class UserLoginEvent extends SigninEvent {
  UserLoginEvent({required this.email, required this.password});
  String email;
  String password;
}
