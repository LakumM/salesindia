import 'package:flutter/material.dart';

@immutable
sealed class SignupState {}

final class SignupInitialState extends SignupState {}
final class SignupLoadingState extends SignupState {}
final class SignupLoadedState extends SignupState {}
final class SignupErrorState extends SignupState {
  String? ErrorMsg;
  SignupErrorState({required this.ErrorMsg});
}
