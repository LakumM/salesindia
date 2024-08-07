part of 'view_cart_bloc.dart';

@override
abstract class ViewCartState {}

class ViewCartInitialState extends ViewCartState {}

class ViewCartLoadingState extends ViewCartState {}

class ViewCartLoadedState extends ViewCartState {
  ViewCartModel? viewCartModel;
  ViewCartLoadedState({required this.viewCartModel});
}

class ViewCartErrorState extends ViewCartState {
  String? errorMsg;
  ViewCartErrorState({required this.errorMsg});
}
