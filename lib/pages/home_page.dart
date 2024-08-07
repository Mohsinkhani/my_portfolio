import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  bool isSkillsVisible = false;

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _scrollListener() {
    final positions = itemPositionsListener.itemPositions.value;
    if (positions.isNotEmpty) {
      final skillsPosition = positions.where((position) => position.index == 2);
      if (skillsPosition.isNotEmpty) {
        final position = skillsPosition.first;
        final screenHeight = MediaQuery.of(context).size.height;
        if (position.itemLeadingEdge < screenHeight) {
          setState(() {
            isSkillsVisible = true;
          });
        }
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
          body: ScrollablePositionedList.builder(
            itemCount: 6, // Ensure itemCount is correct
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return constraints.maxWidth >= MinDesktopWidth
                      ? HeaderDesktop(
                    onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    },
                  )
                      : HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  );
                case 1:
                  return constraints.maxWidth >= MinDesktopWidth
                      ? const MainDesktop()
                      : const MainMobile();
                case 2:
                  return Column(
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
                  );
                case 3:
                  return const ProjectSection();
                case 4:
                  return const ContactSection();
                case 5:
                  return const Footer();
                default:
                  return const SizedBox();
              }
            },
          ),
        );
      }),
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 5) {
      // open a blog page
      js.context.callMethod("open", [SnsLinks.Resume]);
      return;
    }
    itemScrollController.scrollTo(
      index: navIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
