part of 'addtocart_bloc.dart';

@override
abstract class AddToCartState {}

final class AddToCartInitialState extends AddToCartState {}

final class AddToCartLoadingState extends AddToCartState {}

final class AddToCartLoadedState extends AddToCartState {}

final class AddToCartErrorState extends AddToCartState {
  String? errorMsg;
  AddToCartErrorState({required this.errorMsg});
}
