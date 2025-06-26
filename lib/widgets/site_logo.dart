import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 110,
        decoration: BoxDecoration(
          color: CustomColor.whitePrimary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage("assets/images/Mklogo.png"),
            fit: BoxFit.cover,
          ),
        ),
        
        )
    );
  }
}
