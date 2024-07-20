import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_bloc.dart';
import 'package:salesindia/repository/screen/login/bloc/login_bloc.dart';
import 'package:salesindia/repository/screen/onboarding_Screen.dart';
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
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const OnboardingScreen()),
    );
  }
}
