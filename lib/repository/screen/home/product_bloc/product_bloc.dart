import 'package:bloc/bloc.dart';
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
        List<ProductModel> productModel = [];
        var res = await apiHelper.postApi(url: UrlHelper.Products_URl);
        var rawData = ProductModel.fromJson(res);
        productModel.add(rawData);
        emit(ProductLoadedState(prodectModel: productModel));
      } catch (e) {
        emit(ProductErrorState(errorMsg: (e as AppException).toString()));
      }
    });
  }
}
