@override
abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupLoadedState extends SignupState {}

class SignupErrorState extends SignupState {
  String? ErrorMsg;
  SignupErrorState({required this.ErrorMsg});
}
