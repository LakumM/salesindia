part of 'product_bloc.dart';

@override
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  ProductModel? productModel;
  ProductLoadedState({required this.productModel});
}

class ProductErrorState extends ProductState {
  final String errorMsg;
  ProductErrorState({required this.errorMsg});
}
