import '../../../../domain/model/categories_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  CategoriesModel categoriesModel;
  HomeLoadedState({required this.categoriesModel});
}

class HomeErrorState extends HomeState {
  String errorMsg;
  HomeErrorState({required this.errorMsg});
}
