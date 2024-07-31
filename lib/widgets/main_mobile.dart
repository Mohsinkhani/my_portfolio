import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'mohsinkhan03061@gmail.com',
      query:
          'subject=Contact&body=Hello, I would like to get in touch with you.',
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email client';
    }
  }

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
              "assets/images/03.jpg",
              width: screenWidth / 4,
              height: screenHeight / 4,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //intro msg
          Text(
            "Hi \nI'm Mohsin Khan \nA Flutter Developer",
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
                onPressed: _launchEmail,
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
