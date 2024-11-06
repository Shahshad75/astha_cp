part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginUserEvnet extends LoginEvent {
  final String email;
  final String password;

  LoginUserEvnet({required this.email, required this.password});
}

class LoginWithOtpEvent extends LoginEvent {
  final String otp;
  final String email;

  LoginWithOtpEvent({required this.otp, required this.email});
}

class OtpRequestEvent extends LoginEvent {
  final String email;
  OtpRequestEvent({required this.email});
}
