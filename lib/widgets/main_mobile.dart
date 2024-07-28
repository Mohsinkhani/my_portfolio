import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      height: screenHeight,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        //avatar image
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldbgcolor.withOpacity(0.6),
                CustomColor.scaffoldbgcolor.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/images/image.jpg",
              width: screenWidth / 2,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //intro msg
          Text(
            "Hi \nI'm Mohsin khan \nA Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 190,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(CustomColor.yellowPrimary)),
                onPressed: () {},
                child: Text(
                  "Get in Touch",
                  style: TextStyle(color: CustomColor.whiteSecondary),
                )),
          )
        ],
      ),
    );
  }
}
