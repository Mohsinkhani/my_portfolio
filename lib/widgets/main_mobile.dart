import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
      height: 0.65.sh,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      constraints: const BoxConstraints(minHeight: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        //avatar image
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.whitePrimary.withOpacity(0.6),
                CustomColor.whitePrimary.withOpacity(0.4),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.darken,
            child: Image.asset(
              "assets/images/mypicbg.jpeg",
              width: screenWidth / 4,
              height: screenHeight / 4,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //intro msg
          const Text(
            "Hi 👋, I'm Mohsin Khan a Flutter Developer with many years of experience.\nYou will explore about me more down there.",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),

          const SizedBox(
            height: 15,
          ),
          MouseRegion(
            onEnter: (_) => _toggleHover(true),
            onExit: (_) => _toggleHover(false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isHovered ? 200 : 190,
              height: _isHovered ? 60 : 50,
              decoration: BoxDecoration(
                color: _isHovered
                    ? CustomColor.whitePrimary
                    : CustomColor.yellowPrimary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: _launchEmail,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    color: _isHovered ? Colors.black : Colors.black,
                    fontSize: _isHovered ? 18 : 16,
                    //   fontWeight: FontWeight.bold,
                  ),
                  child: const Center(
                    child: Text(
                      "Reach me",
                      style: TextStyle(fontFamily: "FreshMulberryDemo"),
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
