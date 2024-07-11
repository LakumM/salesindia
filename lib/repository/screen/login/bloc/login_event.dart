part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginUser extends LoginEvent {
  final String? email;
  final String? pass;

  LoginUser({required this.email, required this.pass});
}
