import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/data/remote/url_helper.dart';

import '../../../../data/remote/api_helper.dart';
part 'addtocart_event.dart';
part 'addtocart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  ApiHelper apiHelper;
  AddToCartBloc({required this.apiHelper}) : super(AddToCartInitialState()) {
    on<AddInCart>((event, emit) async {
      // TODO: implement event handler
      emit(AddToCartLoadingState());
      try {
        var response = await apiHelper.postApi(
            url: UrlHelper.Add_To_cart,
            isHeadersRequired: true,
            bodyParams: {
              "product_id": event.product_id,
              "user_id": event.user_id,
              "quantity": event.quantity,
            });
        if (response['status'] == "true") {
          emit(AddToCartLoadedState());
        } else
          (emit(AddToCartErrorState(errorMsg: response['message'])));
      } catch (e) {
        emit(AddToCartErrorState(errorMsg: "$e"));
      }
    });
  }
}
