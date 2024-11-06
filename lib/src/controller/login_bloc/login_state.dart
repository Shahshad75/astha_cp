part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSucessState extends LoginState {}

final class LoginFailedState extends LoginState {
  final String message;
  LoginFailedState({required this.message});
}

final class LoginloadingState extends LoginState {}

final class OtpReqSucessState extends LoginState {
  final String message;
  OtpReqSucessState({required this.message});
}

final class OtpReqFailedState extends LoginState {
  final String message;
  OtpReqFailedState({required this.message});
}

final class OtpLoginSucessState extends LoginState {
  final String message;
  OtpLoginSucessState({required this.message});
}

final class OtpLoginFailedState extends LoginState {
  final String message;
  OtpLoginFailedState({required this.message});
}
