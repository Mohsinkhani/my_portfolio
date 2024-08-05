import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/bg3.jpg",
            ),
            fit: BoxFit.cover),
      ),
      height: screenHeight / 1.2,
      margin: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi 👋, I'm Mohsin Khan a Flutter Developer with many years of experience.\nYou will explore about me more down there.",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
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
                        _isHovered
                            ? Color.fromARGB(255, 239, 238, 236)
                            : Colors.orange,
                      ),
                    ),
                    onPressed: _launchEmail,
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _isHovered ? Colors.black : Colors.black,
                        fontSize: _isHovered ? 18 : 16,
                      ),
                      child: Text("Reach me"),
                    ),
                    onHover: _toggleHover,
                  ),
                ),
              ),
            ],
          ),
          Container(
              width: 190.0,
              height: 190.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/mypicbg.jpeg")))),
        ],
      ),
    );
  }
}
