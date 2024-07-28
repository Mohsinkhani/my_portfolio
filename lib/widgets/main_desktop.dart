import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

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
                "Hi \nI'm Mohsin khan \nA Flutter Developer",
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
                    onPressed: () {},
                    child: Text(
                      "Get in Touch",
                      style: TextStyle(color: CustomColor.whiteSecondary),
                    )),
              ),
            ],
          ),
          Image.asset(
            "assets/images/image.jpg",
            width: screenWidth / 2,
          )
        ],
      ),
    );
  }
}
