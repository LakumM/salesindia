import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/data/remote/url_helper.dart';
import 'package:salesindia/domain/model/view_cart_model.dart';

import '../../../../data/remote/api_helper.dart';
import '../../../../domain/model/delete_cartitem.dart';

part 'view_cart_event.dart';
part 'view_cart_state.dart';

class ViewCartBloc extends Bloc<ViewCartEvent, ViewCartState> {
  ApiHelper apiHelper;
  ViewCartBloc({required this.apiHelper}) : super(ViewCartInitialState()) {
    on<ViewCartEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ViewCartLoadingState());
      try {
        var response = await apiHelper.getApi(url: UrlHelper.View_Cart_URl);
        log("${response.toString()}");
        var rawData = ViewCartModel.fromJson(response);
        log("${response.toString()}");
        emit(ViewCartLoadedState(viewCartModel: rawData));
      } catch (e) {
        emit(ViewCartErrorState(errorMsg: "$e"));
      }
    });

    on<DeleteItemInCartEvent>((event, emit) async {
      await apiHelper.postApi(
          url: UrlHelper.Delete_CartItem_URl,
          isHeadersRequired: true,
          bodyParams: {"cart_id": event.cartId});
    });
  }
}
