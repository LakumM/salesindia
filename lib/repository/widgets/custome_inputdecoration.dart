import 'package:flutter/material.dart';

InputDecoration mInputDecoration({
  required String hText,
  Widget? preIcon,
  Widget? suIcon,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hText,
    prefixIcon: preIcon,
    suffixIcon: suIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.black12, width: 3),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.black12, width: 3),
    ),
  );
}
