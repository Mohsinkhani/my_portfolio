import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:myportfolio/constants/size.dart';
import 'package:myportfolio/constants/sns_links.dart';
import 'package:myportfolio/widgets/contact_section.dart';
import 'package:myportfolio/widgets/drawer_mobile.dart';
import 'package:myportfolio/widgets/footer.dart';
import 'package:myportfolio/widgets/header_desktop.dart';
import 'package:myportfolio/widgets/header_mobile.dart';
import 'package:myportfolio/widgets/main_desktop.dart';
import 'package:myportfolio/widgets/main_mobile.dart';
import 'package:myportfolio/widgets/project_section.dart';
import 'package:myportfolio/widgets/skills_desktop.dart';
import 'package:myportfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());

  bool isSkillsVisible = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final renderBox = navBarKeys[2].currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero).dy;
      final screenHeight = MediaQuery.of(context).size.height;
      if (position < screenHeight) {
        setState(() {
          isSkillsVisible = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffaf6480),
          Color(0xffc3cee5),
        ]),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= MinDesktopWidth
              ? null
              : DrawerMobile(
            onNavItemTap: (int navIndex) {
              scaffoldKey.currentState?.closeEndDrawer();
              scrollToSection(navIndex);
            },
          ),
          body: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              SizedBox(
                key: navBarKeys.first,
              ),
              // main
              if (constraints.maxWidth >= MinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (constraints.maxWidth >= MinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),
              // skills
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "My Stack",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      // color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // platform and skills
                  Visibility(
                    visible: isSkillsVisible,
                    child: constraints.maxWidth >= MedDesktopWidth
                        ? const SkillsDesktop()
                        : const SkillsMobile(),
                  ),
                ],
              ),
              // projects
              ProjectSection(
                key: navBarKeys[2],
              ),
              // contact
              ContactSection(key: navBarKeys[3]),
              const SizedBox(
                height: 30,
              ),
              // footer
              const Footer(),
            ],
          ),
        );
      }),
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      js.context.callMethod("open", [SnsLinks.Resume]);
      return;
    }
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut);
  }
}
