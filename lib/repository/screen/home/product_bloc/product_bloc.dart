import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/data/remote/url_helper.dart';
import 'package:salesindia/domain/constents/exception.dart';
import '../../../../data/remote/api_helper.dart';
import '../../../../domain/model/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ApiHelper apiHelper;

  ProductBloc({required this.apiHelper}) : super(ProductInitialState()) {
    on<GetProduct>((event, emit) async {
      emit(ProductLoadingState());
      try {
        var response = await apiHelper.postApi(
            url: UrlHelper.Products_URl, isHeadersRequired: true);
        var productData = ProductModel.fromJson(response);
        emit(ProductLoadedState(productModel: productData));
      } catch (e) {
        print(" errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $e");
      }
    });
  }
}
