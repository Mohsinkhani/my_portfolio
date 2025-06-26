import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textOpacity;
  late Animation<double> _imageScale;
  late Animation<Offset> _textOffset;
  late Animation<Offset> _imageOffset;
  
  bool _isHovered = false;
  bool _isButtonHovered = false;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    
    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    
    _imageScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
      ),
    );
    
    _textOffset = Tween<Offset>(
      begin: const Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
    ));
    
    _imageOffset = Tween<Offset>(
      begin: const Offset(0.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
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
    final theme = Theme.of(context);

    return Container(
      height: 0.9.sh,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(minHeight: 350),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 900;
          return isWideScreen ? buildRowLayout(theme) : buildColumnLayout(theme);
        },
      ),
    );
  }

  Widget buildRowLayout(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: SlideTransition(
            position: _textOffset,
            child: FadeTransition(
              opacity: _textOpacity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Animated title with typing effect
                  DefaultTextStyle(
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hi 👋, I'm ",
                          speed: const Duration(milliseconds: 50),
                        ),
                      ],
                      isRepeatingAnimation: false,
                      displayFullTextOnTap: true,
                    ),
                  ),
                  
                  // Animated name with color change
                  DefaultTextStyle(
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.orange,
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
                          textStyle: theme.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w800,
                            height: 1.5,
                          ),
                          colors: [
                            Colors.orange,
                            Colors.deepOrange,
                            Colors.amber,
                            Colors.orange,
                          ],
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      isRepeatingAnimation: true,
                      displayFullTextOnTap: true,
                    ),
                  ),
                  
                  // Animated role title
                  DefaultTextStyle(
                    style: theme.textTheme.headlineMedium!.copyWith(
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
                          "Web Developer",
                          duration: const Duration(seconds: 2),
                          fadeInEnd: 0.5,
                          fadeOutBegin: 0.8,
                        ),
                        FadeAnimatedText(
                          "Full Stack Developer",
                          duration: const Duration(seconds: 2),
                          fadeInEnd: 0.5,
                          fadeOutBegin: 0.8,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      displayFullTextOnTap: true,
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  Text(
                    "Full-stack developer with 2 years of experience building high-performance mobile and web apps using Flutter, React, JavaScript, and TypeScript.  \n "
                    "Focused on crafting beautiful, cross-platform user experiences.",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  MouseRegion(
                    onEnter: (_) => _toggleHover(true),
                    onExit: (_) => _toggleHover(false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _isButtonHovered ? 220 : 200,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: _isButtonHovered
                            ? [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.6),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 5),
                                )
                              ]
                            : [],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        onPressed: _launchEmail,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.only(
                                  right: _isButtonHovered ? 15 : 10),
                              child: const Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                            ),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: _isButtonHovered ? 18 : 16,
                                fontWeight: FontWeight.bold,
                              ),
                              child: const Text("Get in Touch"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        SlideTransition(
          position: _imageOffset,
          child: ScaleTransition(
            scale: _imageScale,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: _isHovered ? 250.0 : 220.0,
                height: _isHovered ? 250.0 : 220.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/mypic.jpeg"),
                  ),
                  border: Border.all(
                    color: _isHovered ? Colors.orange : Colors.white,
                    width: _isHovered ? 4 : 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildColumnLayout(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _imageScale,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: _isHovered ? 200.0 : 180.0,
              height: _isHovered ? 200.0 : 180.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/mypicbg.jpeg"),
                ),
                border: Border.all(
                  color: _isHovered ? Colors.orange : Colors.white,
                  width: _isHovered ? 3 : 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 3,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        FadeTransition(
          opacity: _textOpacity,
          child: Column(
            children: [
              // Animated title for mobile
              DefaultTextStyle(
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.5,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "Hi 👋, I'm ",
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
              
              // Animated name for mobile
              DefaultTextStyle(
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange,
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
                      textStyle: theme.textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                      ),
                      colors: [
                        Colors.orange,
                        Colors.deepOrange,
                        Colors.amber,
                        Colors.orange,
                      ],
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
              
              // Animated role for mobile
              DefaultTextStyle(
                style: theme.textTheme.headlineSmall!.copyWith(
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
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
              
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Crafting beautiful, high-performance cross-platform apps with Flutter. "
                  "With years of experience building robust mobile solutions.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        MouseRegion(
          onEnter: (_) => _toggleHover(true),
          onExit: (_) => _toggleHover(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isButtonHovered ? 220 : 200,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: _isButtonHovered
                  ? [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.6),
                        blurRadius: 15,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      )
                    ]
                  : [],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15),
              ),
              onPressed: _launchEmail,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.only(
                        right: _isButtonHovered ? 15 : 10),
                    child: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: _isButtonHovered ? 18 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                    child: const Text("Get in Touch"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}