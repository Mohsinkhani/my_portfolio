import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageScale;
  late Animation<double> _textOpacity;
  late Animation<Offset> _contentOffset;
  
  bool _isHovered = false;
  bool _isButtonHovered = false;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    
    _imageScale = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );
    
    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );
    
    _contentOffset = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutQuad),
      ),
    );
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'mohsinkhan03061@gmail.com',
      query: 'subject=Contact&body=Hello, I would like to get in touch with you.',
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email client';
    }
  }

  void _toggleHover(bool isHovered) {
    setState(() {
      _isButtonHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    return SlideTransition(
      position: _contentOffset,
      child: Container(
        height: 0.65.sh,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        constraints: const BoxConstraints(minHeight: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar image with scale animation
           ScaleTransition(
  scale: _imageScale,
  child: MouseRegion(
    onEnter: (_) => setState(() => _isHovered = true),
    onExit: (_) => setState(() => _isHovered = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: screenWidth < 600 ? screenWidth / 2.5 : screenWidth / 3.5,
      height: screenWidth < 600 ? screenWidth / 2.5 : screenWidth / 3.5, // ✅ Make height = width
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _isHovered ? CustomColor.yellowPrimary : Colors.white,
          width: _isHovered ? 3 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color:  Colors.orangeAccent,
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          "assets/images/mypic.jpeg",
          fit: BoxFit.cover, // ✅ Ensures full circular fill
        ),
      ),
    ),
  ),
),

            
            const SizedBox(height: 25),
            
            // Animated intro text
            FadeTransition(
              opacity: _textOpacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hi 👋, I'm ",
                          speed: const Duration(milliseconds: 60),
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),
                  
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      //  color: CustomColor.yellowPrimary,
                      height: 1.5,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "Mohsin Khan",
                          speed: const Duration(milliseconds: 100),
                        ),
                        ColorizeAnimatedText(
                          "Mohsin Khan",
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            height: 1.5,
                          ),
                          colors: [
                            CustomColor.yellowPrimary,
                            Colors.amber,
                            Colors.orange,
                            CustomColor.yellowPrimary,
                          ],
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                  
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          "Flutter Developer",
                          duration: const Duration(seconds: 2),
                          fadeInEnd: 0.5,
                          fadeOutBegin: 0.8,
                        ),
                        FadeAnimatedText(
                          "Mobile App Developer",
                          duration: const Duration(seconds: 2),
                          fadeInEnd: 0.5,
                          fadeOutBegin: 0.8,
                        ),
                         FadeAnimatedText(
                          "Web App Developer",
                          duration: const Duration(seconds: 2),
                          fadeInEnd: 0.5,
                          fadeOutBegin: 0.8,
                        ),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  Text(
                    "Full-stack developer with 2 years of experience building high-performance mobile and web apps using Flutter, React, JavaScript, and TypeScript.  \n "
                    "Focused on crafting beautiful, cross-platform user experiences.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      fontStyle: FontStyle.italic,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 25),
            
            // Animated button
            MouseRegion(
              onEnter: (_) => _toggleHover(true),
              onExit: (_) => _toggleHover(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isButtonHovered ? 180 : 160,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      CustomColor.yellowPrimary,
                      Colors.orange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: _isButtonHovered
                      ? [
                          BoxShadow(
                            color: CustomColor.yellowPrimary.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 3),
                          )
                        ]
                      : [],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: _launchEmail,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.only(
                            right: _isButtonHovered ? 10 : 5),
                        child: Icon(
                          Icons.email,
                          color: Colors.black,
                          size: _isButtonHovered ? 20 : 18,
                        ),
                      ),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: _isButtonHovered ? 16 : 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "FreshMulberryDemo",
                        ),
                        child: const Text("Reach me"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}