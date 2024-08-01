import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/constants/colors.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
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
      height: screenHeight / 1.2,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/code.jpg"),fit: BoxFit.cover)
      ),
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorizeAnimatedTextKit(
                text: [
                  "Hi \nI am Mohsin Khan \nA Flutter Developer",
                ],
                textStyle: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontFamily: "FreshMulberryDemo",
                  fontWeight: FontWeight.bold,
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
              SizedBox(
                width: 250,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _isHovered ? 200 : 190,
                  height: _isHovered ? 60 : 50,
                  curve: Curves.easeInOut,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          _isHovered ? Colors.orange : Colors.yellow),
                    ),
                    onPressed: _launchEmail,
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _isHovered ? Colors.black : Colors.white,
                        fontSize: _isHovered ? 18 : 16,
                      ),
                      child: Text("Get in Touch"),
                    ),
                    onHover: _toggleHover,
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/03.jpg",
            width: screenWidth / 1.5,
            height: screenHeight / 1.7,
          )
        ],
      ),
    );
  }
}
