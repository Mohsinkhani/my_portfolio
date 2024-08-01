import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/constants/colors.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
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

  bool _isHovered = false;

  void _toggleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
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
            blendMode: BlendMode.darken,
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
          ColorizeAnimatedTextKit(
            text: [
              "Hi \nI am Mohsin Khan \nA Flutter Developer",
            ],
            textStyle: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
              fontFamily: "FreshMulberryDemo"
            ),
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.yellow,
              Colors.red,
            ],
            // textAlign: TextAlign.center,
            // alignment: AlignmentDirectional.topStart,
          ),
          const SizedBox(
            height: 15,
          ),
          MouseRegion(
            onEnter: (_) => _toggleHover(true),
            onExit: (_) => _toggleHover(false),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _isHovered ? 200 : 190,
              height: _isHovered ? 60 : 50,
              decoration: BoxDecoration(
                color: _isHovered ? Colors.orange : CustomColor.yellowPrimary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: _launchEmail,
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    color: _isHovered ? Colors.black : CustomColor.whiteSecondary,
                    fontSize: _isHovered ? 18 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Center(
                    child: Text("Get in Touch",
                      // style: TextStyle(fontFamily: "FreshMulberryDemo"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
