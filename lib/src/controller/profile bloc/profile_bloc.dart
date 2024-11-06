import 'dart:async';

import 'package:astha_cp/src/model/user_model.dart';
import 'package:astha_cp/src/network/local/sharedpref.dart';
import 'package:astha_cp/src/repositorie/profile_repo.dart';
import 'package:bloc/bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileDataEvent>(getProfileData);
  }

  FutureOr<void> getProfileData(
      GetProfileDataEvent event, Emitter<ProfileState> emit) async {
    print('called');
    emit(ProfileDataLoadingState());
    try {
      final token = SharedPrefModel.instance.getData('token');
      print('token got $token');
      final either = await ProfileRepo().getProfileData(token);
      either.fold((error) {
        emit(ProfileDataErrorState(message: error.message));
      }, (response) {
        UserModel user = UserModel.fromJson(response);
        print('got the user $user');
        emit(ProfileDataSuccessState(userModel: user));
      });
    } catch (e) {
      emit(ProfileDataErrorState(message: e.toString()));
    }
  }
}
