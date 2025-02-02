import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final screenHeight = screenSize.height;

    return Container(
      height: 0.9.sh,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(minHeight: 350),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth >
              900; // Adjust the width threshold as needed
          return isWideScreen ? buildRowLayout() : buildColumnLayout();
        },
      ),
    );
  }

  Widget buildRowLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hi 👋, I'm Mohsin Khan a Flutter Developer with many years of experience.\nYou will explore about me more down there.",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isHovered ? 200 : 190,
                height: _isHovered ? 60 : 50,
                curve: Curves.easeInOut,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isHovered
                          ? const Color.fromARGB(255, 239, 238, 236)
                          : Colors.orange,
                    ),
                  ),
                  onPressed: _launchEmail,
                  onHover: _toggleHover,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      color: _isHovered ? Colors.black : Colors.black,
                      fontSize: _isHovered ? 18 : 16,
                    ),
                    child: const Text(
                      "Reach me",
                      style: TextStyle(fontFamily: "FreshMulberryDemo"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 190.0,
          height: 190.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/mypicbg.jpeg"),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildColumnLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 190.0,
          height: 190.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/mypicbg.jpeg"),
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Hi 👋, I'm Mohsin Khan a Flutter Developer with many years of experience.\nYou will explore about me more down there.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 250,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isHovered ? 200 : 190,
            height: _isHovered ? 60 : 50,
            curve: Curves.easeInOut,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  _isHovered
                      ? const Color.fromARGB(255, 239, 238, 236)
                      : Colors.orange,
                ),
              ),
              onPressed: _launchEmail,
              onHover: _toggleHover,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: _isHovered ? Colors.black : Colors.black,
                  fontSize: _isHovered ? 18 : 16,
                ),
                child: const Text("Reach me"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
