import 'package:flutter/material.dart';

TextStyle mFontStyle(
    {Color color = Colors.black,
    var fontWeight = FontWeight.w500,
    double fontSize = 16}) {
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontFamily: "AppMainFonts",
    fontSize: fontSize,
  );
}
