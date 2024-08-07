import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesindia/domain/constents/app_prefs.dart';
import 'package:salesindia/domain/model/login_model.dart';
import '../../../../data/remote/api_helper.dart';
import '../../../../data/remote/url_helper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiHelper apiHelper;

  LoginBloc({required this.apiHelper}) : super(LoginInitialState()) {
    on<LoginUser>((event, emit) async {
      emit(LoginLodingState());
      try {
        var resData =
            await apiHelper.postApi(url: UrlHelper.Login_User_URL, bodyParams: {
          "email": event.email,
          "password": event.pass,
        });
        var rawData = LoginSignupModel.fromJson(resData);
        if (rawData.status!) {
          ///shared Preferences
          AppPrefs().setPrefs(rawData.token!);
          emit(LoginLodedState());
        }
      } catch (e) {
        emit(LoginErrorState(errorMsg: "$e"));
      }
    });
  }
}
