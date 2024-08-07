import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/repository/screen/cart_screen/cart_bloc/view_cart_bloc.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_bloc.dart';
import 'package:salesindia/repository/screen/home/product_bloc/product_bloc.dart';
import 'package:salesindia/repository/screen/login/bloc/login_bloc.dart';
import 'package:salesindia/repository/screen/onboarding_Screen.dart';
import 'package:salesindia/repository/screen/product_details/add_to_cart_bloc/addtocart_bloc.dart';
import 'package:salesindia/repository/screen/profile/profile_bloc/profile_bloc.dart';
import 'package:salesindia/repository/screen/signup/bloc/signup_bloc.dart';

import 'data/remote/api_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(apiHelper: ApiHelper()),
        ),
        BlocProvider(
          create: (context) => SignupBloc(apiHelper: ApiHelper()),
        ),
        BlocProvider(create: (context) => HomeBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context) => ProductBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context) => ProfileBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context) => ViewCartBloc(apiHelper: ApiHelper())),
        BlocProvider(
            create: (context) => AddToCartBloc(apiHelper: ApiHelper())),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: OnboardingScreen()),
    );
  }
}
