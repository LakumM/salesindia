import 'package:flutter/material.dart';

import '../widgets/cust_buttons.dart';
import 'login/signin_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.8,
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner/onboard.jpg'),
                      fit: BoxFit.fitWidth)),
            ),
            Positioned(
              bottom: 40,
              right: 60,
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
            )
          ],
        ),
      ),
    );
  }
}
