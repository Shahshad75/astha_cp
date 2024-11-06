import 'dart:async';

import 'package:astha_cp/src/network/local/sharedpref.dart';
import 'package:astha_cp/src/repositorie/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvnet>(loginUserEvnet);
    on<OtpRequestEvent>(otpRequestEvent);
    on<LoginWithOtpEvent>(loginWithOtpEvent);
  }

  FutureOr<void> loginUserEvnet(
      LoginUserEvnet event, Emitter<LoginState> emit) async {
    emit(LoginloadingState());
    final either = await AuthRepo()
        .loginFnc({"email": event.email, "password": event.password});
    either.fold((error) => emit(LoginFailedState(message: error.message)),
        (response) {
      SharedPrefModel.instance.insertData("token", response["token"]);
      emit(LoginSucessState());
    });
  }

  FutureOr<void> otpRequestEvent(
      OtpRequestEvent event, Emitter<LoginState> emit) async {
    emit(LoginloadingState());
    final either =
        await AuthRepo().otpRequestFucn({"emailOrMobile": event.email});
    either.fold((error) => emit(OtpReqFailedState(message: error.message)),
        (response) {
      emit(OtpReqSucessState(message: response["message"]));
    });
  }

  FutureOr<void> loginWithOtpEvent(
      LoginWithOtpEvent event, Emitter<LoginState> emit) async {
    emit(LoginloadingState());
    final either = await AuthRepo()
        .loginWithOtpFuc({"emailOrMobile": event.email, "otp": event.otp});

    either.fold((error) => emit(OtpLoginFailedState(message: error.message)),
        (response) {
      SharedPrefModel.instance.insertData("token", response["token"]);

      emit(OtpLoginSucessState(message: "Login Sucessfully"));
    });
  }
}
