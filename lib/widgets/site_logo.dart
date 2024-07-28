import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text("MK",
          style: TextStyle(
              color: CustomColor.yellowSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              decoration: TextDecoration.underline)),
    );
  }
}
