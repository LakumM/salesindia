import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/repository/screen/login/bloc/login_bloc.dart';
import 'package:salesindia/repository/screen/login/signin_screen.dart';
import 'package:salesindia/repository/screen/signup/bloc/signup_bloc.dart';
import 'package:salesindia/repository/screen/signup/bloc/signup_event.dart';
import 'package:salesindia/repository/screen/signup/bloc/signup_state.dart';
import '../../../data/remote/api_helper.dart';
import '../../../data/remote/url_helper.dart';
import '../../utils/font_style.dart';
import '../../widgets/cust_buttons.dart';
import '../../widgets/cust_tf_inputdecoration.dart';

final _valFormKey = GlobalKey<FormState>();

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isHidePass = true;
  bool isHideConPass = true;
  ApiHelper? apiHelper;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobilController = TextEditingController();
  var passController = TextEditingController();
  var conPassController = TextEditingController();

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isValidPass(String pass) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _valFormKey,
            child: Column(
              children: [
                Text(
                  "Sign up",
                  style: mFontStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "create your account",
                  style: mFontStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                mSpacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      /*color: Color(0xFFD7DADA),*/
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.white10,
                        )
                      ]),
                  child: ListView(
                    children: [
                      mSpacer(),

                      /// Name Text-Field
                      TextFormField(
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return "This field is *required";
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: mInputDecoration(
                            hText: "Full Name",
                            preIcon: Icon(Icons.manage_accounts_outlined)),
                      ),
                      mSpacer(),

                      /// Email Text-Field
                      TextFormField(
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return "This field is *required";
                          } else if (!isValidEmail(email)) {
                            return "Please enter valid Email";
                          }
                          return null;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: mInputDecoration(
                            hText: "Email",
                            preIcon: Icon(Icons.email_outlined)),
                      ),
                      mSpacer(),

                      /// Mobile Number Text-Field
                      TextFormField(
                        validator: (mobil) {
                          if (mobil == null || mobil.isEmpty) {
                            return "This field is *required";
                          }
                          return null;
                        },
                        controller: mobilController,
                        keyboardType: TextInputType.phone,
                        decoration: mInputDecoration(
                            hText: "Mobile No.",
                            preIcon: Icon(Icons.phone_android_outlined)),
                      ),
                      mSpacer(),

                      /// Password Text-Field
                      TextFormField(
                        validator: (pass) {
                          if (pass == null || pass.isEmpty) {
                            return "This field is *required";
                          } else if (!isValidPass(pass)) {
                            return "Enter strong password";
                          }
                          return null;
                        },
                        controller: passController,
                        obscureText: isHidePass,
                        decoration: mInputDecoration(
                            hText: "Password",
                            preIcon: Icon(Icons.lock_outline_rounded),
                            suIcon: IconButton(
                                onPressed: () {
                                  isHidePass = !isHidePass;
                                  setState(() {});
                                },
                                icon: isHidePass
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.remove_red_eye_outlined))),
                      ),
                      mSpacer(),

                      ///Confirm Password Text-Field
                      TextFormField(
                        validator: (conPass) {
                          if (passController.text == conPassController.text) {
                            return "Con. password not match";
                          }
                          return null;
                        },
                        obscureText: isHideConPass,
                        decoration: mInputDecoration(
                            hText: "Confirm Password",
                            preIcon: Icon(
                              Icons.lock_outline_rounded,
                            ),
                            suIcon: IconButton(
                                onPressed: () {
                                  isHideConPass = !isHideConPass;
                                  setState(() {});
                                },
                                icon: isHideConPass
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.remove_red_eye_outlined))),
                      ),
                      mSpacer(),

                      /// Sign up Button
                      Container(
                          height: 45,
                          width: 220,
                          child: BlocListener<SignupBloc, SignupState>(
                            listener: (context, state) {
                              print(state);
                              if (state is SignupLoadingState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: CircularProgressIndicator()));
                              } else if (state is SignupErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('${state.ErrorMsg}')));
                              } else if (state is SignupLoadedState) {
                                //print('')
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('SignUp Success')));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SigninScreen()));
                              }
                            },
                            child: CustButtons(
                                text: "Sign up",
                                onPress: () {
                                  if (_valFormKey.currentState!.validate()) {
                                    BlocProvider.of<SignupBloc>(context).add(
                                        SignupUser(
                                            name: nameController.text,
                                            email: emailController.text,
                                            mobile_number: mobilController.text,
                                            password: passController.text));
                                  }
                                }),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: mFontStyle(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SigninScreen()));
                              },
                              child: Text(
                                'Login',
                                style: mFontStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mSpacer({double mheight = 16}) {
    return SizedBox(
      height: mheight,
    );
  }
}
