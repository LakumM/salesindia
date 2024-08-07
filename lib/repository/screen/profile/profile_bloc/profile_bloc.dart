import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/data/remote/url_helper.dart';
import 'package:salesindia/domain/model/profile_model.dart';
import '../../../../data/remote/api_helper.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ApiHelper apiHelper;
  ProfileBloc({required this.apiHelper}) : super(ProfileInitialState()) {
    on<GetProDetails>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileLoadingState());
      try {
        var proData = await apiHelper.postApi(
            url: UrlHelper.Profile_URl, isHeadersRequired: true);
        var rawData = ProfileModel.fromJson(proData);
        emit(ProfileLoadedState(profileModel: rawData));
      } catch (e) {
        emit(ProfileErrorState(errorMsg: "$e"));
      }
    });
  }
}
