part of 'view_cart_bloc.dart';

@override
abstract class ViewCartEvent {}

class ViewInCart extends ViewCartEvent {}

class DeleteItemInCartEvent extends ViewCartEvent {
  String? cartId;

  DeleteItemInCartEvent({required this.cartId});
}
