part of 'signin_bloc.dart';


abstract class SigninState {}

class SigninInitial extends SigninState {}
class LoginSuccess extends SigninState {}

class LoginFailed extends SigninState {
  LoginFailed({required this.error_message});
  String error_message;
}
