import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key, this.controller, this.hintText, this.maxLines = 1});
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: CustomColor.scaffoldbgcolor),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whiteSecondary,
          focusedBorder: getInputBorder,
          enabledBorder: getInputBorder,
          border: getInputBorder,
          hintText: hintText,
          hintStyle: TextStyle(color: CustomColor.whitePrimary)),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
  }
}
