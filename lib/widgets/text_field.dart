import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.maxLines = 1,
      this.labelText});
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: CustomColor.scaffoldbgcolor),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: getInputBorder,
          enabledBorder: getInputBorder,
          border: getInputBorder,

          // labelText: labelText,
          // labelStyle: TextStyle(color: Colors.black ),
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey, fontFamily: "FreshMulberryDemo")),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 3, color: Colors.white));
  }
}
