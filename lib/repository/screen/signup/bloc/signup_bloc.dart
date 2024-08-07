import 'package:bloc/bloc.dart';
import 'package:salesindia/data/remote/url_helper.dart';
import 'package:salesindia/domain/constents/exception.dart';
import 'package:salesindia/domain/model/login_model.dart';
import 'package:salesindia/repository/screen/signup/bloc/signup_event.dart';
import 'package:salesindia/repository/screen/signup/bloc/signup_state.dart';
import '../../../../data/remote/api_helper.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  ApiHelper apiHelper;
  SignupBloc({required this.apiHelper}) : super(SignupInitialState()) {
    on<SignupUser>((event, emit) async {
      emit(SignupLoadingState());
      try {
        var resData = await apiHelper
            .postApi(url: UrlHelper.Register_User_URL, bodyParams: {
          'name': event.name,
          'email': event.email,
          'mobile_number': event.mobile_Number,
          'password': event.password,
        });
        LoginSignupModel.fromJson(resData);
        emit(SignupLoadedState());
      } catch (e) {
        emit(SignupErrorState(ErrorMsg: (e as AppException).toString()));
      }
    });
  }
}
