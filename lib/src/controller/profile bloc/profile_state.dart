part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileDataLoadingState extends ProfileState {}

final class ProfileDataSuccessState extends ProfileState {
  UserModel userModel;

  ProfileDataSuccessState({required this.userModel});
}

final class ProfileDataErrorState extends ProfileState {
  final String message;

  ProfileDataErrorState({required this.message});
}
