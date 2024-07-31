import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

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
                "Hi \nI'm Mohsin Khan \nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColor.yellowPrimary)),
                    onPressed: _launchEmail,
                    child: Text(
                      "Get in Touch",
                      style: TextStyle(color: CustomColor.whiteSecondary),
                    )),
              ),
            ],
          ),
          Image.asset(
            "assets/images/03.jpg",
            width: screenWidth / 4,
            height: screenHeight / 4,
          )
        ],
      ),
    );
  }
}
