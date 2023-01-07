part of 'authentication_bloc.dart';


abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class RegisterSuccess extends AuthenticationState {}


class RegisterFailed extends AuthenticationState {
  String error_message;
  RegisterFailed({required this.error_message});
}
