import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/data/remote/url_helper.dart';
import 'package:salesindia/domain/constents/exception.dart';
import 'package:salesindia/domain/model/categories_model.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_event.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_state.dart';
import '../../../../data/remote/api_helper.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ApiHelper apiHelper;
  HomeBloc({required this.apiHelper}) : super(HomeInitialState()) {
    on<GetCategoryEvent>((event, emit) {
      // TODO: implement event handler
      emit(HomeLoadingState());
      try {
        List<CategoriesModel> catDataModel = [];
        dynamic catData = apiHelper.getApi(url: UrlHelper.Categories_URl);
        for (Map<String, dynamic> eachData in catData) {
          var eachModel = CategoriesModel.fromJson(eachData);
          catDataModel.add(eachModel);
        }
        emit(HomeLoadedState(catModel: catDataModel));
      } catch (e) {
        emit(HomeErrorState(errorMsg: (e as AppException).toString()));
      }
    });
  }
}
