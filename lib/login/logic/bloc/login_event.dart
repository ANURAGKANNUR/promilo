part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class SignInEvent extends LoginEvent {
  final String userName;
  final String password;
  SignInEvent({required this.password, required this.userName});
}
