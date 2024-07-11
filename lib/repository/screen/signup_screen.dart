import 'package:flutter/material.dart';
import '../../data/remote/api_helper.dart';
import '../../data/remote/url_helper.dart';
import '../utils/font_style.dart';
import '../widgets/cust_buttons.dart';
import '../widgets/cust_tf_inputdecoration.dart';

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

  callApi() {
    apiHelper = ApiHelper();
    apiHelper!.postApi(url: UrlHelper.Register_User_URL, mData: {
      'name': nameController.text,
      'mobile_number': mobilController.text,
      'email': emailController.text,
      'password': passController.text
    }).then(
      (value) {
        if (value.massage != null) {
          print(" get Dat " + value.message);
        } else {
          print(value.status);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
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
                child: Column(
                  children: [
                    mSpacer(),
                    TextField(
                      controller: nameController,
                      decoration: mInputDecoration(
                          hText: "Full Name",
                          preIcon: Icon(Icons.manage_accounts_outlined)),
                    ),
                    mSpacer(),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: mInputDecoration(
                          hText: "Email", preIcon: Icon(Icons.email_outlined)),
                    ),
                    mSpacer(),
                    TextField(
                      controller: mobilController,
                      keyboardType: TextInputType.phone,
                      decoration: mInputDecoration(
                          hText: "Mobile No.",
                          preIcon: Icon(Icons.phone_android_outlined)),
                    ),
                    mSpacer(),
                    TextField(
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
                    TextField(
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
                        child: CustButtons(
                            text: "Sign up",
                            onPress: () {
                              callApi();
                              setState(() {});
                            })),
                    mSpacer(),
                    Text(
                      'or',
                      style:
                          mFontStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Allredy have an account?',
                          style: mFontStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
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
    );
  }

  Widget mSpacer({double mheight = 16}) {
    return SizedBox(
      height: mheight,
    );
  }
}
