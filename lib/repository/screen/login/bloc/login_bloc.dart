import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/remote/api_helper.dart';
import '../../../../data/remote/url_helper.dart';
import '../../../../domain/constents/exception.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiHelper apiHelper;

  LoginBloc({required this.apiHelper}) : super(LoginInitialState()) {
    on<LoginUser>((event, emit) async {
      emit(LoginLodingState());
      try {
        var resData =
            await apiHelper.postApi(url: UrlHelper.Login_User_URL, mData: {
          "email": event.email,
          "password": event.pass,
        }) as JsonResponse;
        if (resData.status!) {
          ///shared Preferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', resData.token!);
          emit(LoginLodedState());
        }
      } catch (e) {
        print("ssssssssssssssssssssssssss $e");
        emit(LoginErrorState(errorMsg: (e as AppException).toString()));
      }
    });
  }
}
