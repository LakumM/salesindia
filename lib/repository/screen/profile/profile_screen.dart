import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/data/remote/api_helper.dart';
import 'package:salesindia/repository/screen/profile/profile_bloc/profile_bloc.dart';
import 'package:salesindia/repository/utils/font_style.dart';
import 'package:salesindia/repository/widgets/cust_buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(GetProDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            print(state);
            if (state is ProfileLoadingState) {
              return CircularProgressIndicator();
            } else if (state is ProfileLoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/icon/ic_admin-alt.png',
                        height: 80,
                        width: 80,
                      ),
                    ),
                    mSize(),
                    Row(
                      children: [
                        Text(
                          "Name : ",
                          style: mFontStyle(),
                        ),
                        /*Text("${state.profileModel!.data![5].name}"),*/
                      ],
                    ),
                    mSize(),
                    Row(
                      children: [
                        Text("Email : ", style: mFontStyle()),
                        Text(""),
                      ],
                    ),
                    mSize(),
                    Row(
                      children: [
                        Text("Mobile No. : ", style: mFontStyle()),
                        Text("", style: mFontStyle()),
                      ],
                    ),
                    mSize(),
                    CustomButtons(text: "Logout", onPress: () {})
                  ],
                ),
              );
            } else if (state is ProfileErrorState) {}
            return Container();
          },
        ));
  }

  Widget mSize() {
    return SizedBox(
      height: 20,
    );
  }
}
