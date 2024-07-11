import 'package:flutter/material.dart';

import '../utils/font_style.dart';

class CustButtons extends StatelessWidget {
  String text;
  VoidCallback onPress;
  Color bgColor;
  CustButtons(
      {this.bgColor = Colors.black, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
      onPressed: onPress,
      child: Text("$text",
          style: mFontStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
