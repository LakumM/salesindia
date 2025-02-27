import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/data/remote/url_helper.dart';
import 'package:salesindia/domain/model/categories_model.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_event.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_state.dart';
import '../../../../data/remote/api_helper.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ApiHelper apiHelper;
  HomeBloc({required this.apiHelper}) : super(HomeInitialState()) {
    on<GetCategoryEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        var catData = await apiHelper.getApi(url: UrlHelper.Categories_URl);
        var catModel = CategoriesModel.fromJson(catData);
        emit(HomeLoadedState(categoriesModel: catModel));
      } catch (e) {
        emit(HomeErrorState(errorMsg: e.toString()));
      }
    });
  }
}
