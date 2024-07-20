import '../../../../domain/model/categories_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  Categories catModel;
  HomeLoadedState({required this.catModel});
}

class HomeErrorState extends HomeState {
  String errorMsg;
  HomeErrorState({required this.errorMsg});
}
