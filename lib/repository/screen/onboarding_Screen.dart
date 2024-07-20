import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/cust_buttons.dart';
import 'login/signin_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.sizeOf(context).height * 0.8,
            /* decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/banner/onboard.jpg'),
                    fit: BoxFit.fitWidth)),*/
            child: Lottie.asset('assets/lottie/lot_Woman_thinking.json',
                fit: BoxFit.contain),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 280,
                height: 55,
                child: CustButtons(
                    bgColor: const Color(0xFF2C2C2C),
                    text: "Get Started...!",
                    onPress: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SigninScreen()));
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
