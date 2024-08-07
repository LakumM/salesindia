part of 'addtocart_bloc.dart';

@override
abstract class AddToCartEvent {}

class AddInCart extends AddToCartEvent {
  int? user_id;
  int? product_id;
  int? quantity;
  AddInCart({this.product_id, this.quantity, this.user_id});
}
