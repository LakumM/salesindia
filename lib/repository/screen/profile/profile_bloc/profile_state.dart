part of 'profile_bloc.dart';

@override
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  ProfileModel? profileModel;
  ProfileLoadedState({required this.profileModel});
}

class ProfileErrorState extends ProfileState {
  String errorMsg;
  ProfileErrorState({required this.errorMsg});
}
