import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myportfolio/constants/colors.dart';
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
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Scaffoldkey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: Scaffoldkey,
        backgroundColor: CustomColor.scaffoldbgcolor,
        endDrawer: Constraints.maxWidth >= MinDesktopWidth
            ? null
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  Scaffoldkey.currentState?.closeEndDrawer();
                  ScrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(
                key: navBarKeys.first,
              ),
              //main
              if (Constraints.maxWidth >= MinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    ScrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    Scaffoldkey.currentState?.openEndDrawer();
                  },
                ),
              if (Constraints.maxWidth >= MinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),
              //skills
              Container(
                key: navBarKeys[1],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: Colors.blueGrey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "What i can do",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //plateform and skills
                    if (Constraints.maxWidth >= MedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile()
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //projects
              ProjectSection(
                key: navBarKeys[2],
              ),
              //contact
              ContactSection(key: navBarKeys[3]),
              const SizedBox(
                height: 30,
              ),
              //footer
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void ScrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      js.context.callMethod("open", [SnsLinks.Resume]);
      return;
    }
    final Key = navBarKeys[navIndex];
    Scrollable.ensureVisible(Key.currentContext!,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut);
  }
}
