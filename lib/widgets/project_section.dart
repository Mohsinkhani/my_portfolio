import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/utils/project_utils.dart';
import 'package:myportfolio/widgets/project_card.dart';
import 'package:myportfolio/widgets/projectdetailScreen.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColor.bglight1.withOpacity(0.1),
            CustomColor.bglight2.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          _buildSectionTitle("Organizations Projects"),
          const SizedBox(height: 40),
          _buildProjectGrid(workProjectUtils, context),
          const SizedBox(height: 80),
          _buildSectionTitle("My Startups"),
          const SizedBox(height: 40),
          _buildProjectGrid(hobbyProjectUtils, context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: CustomColor.whitePrimary,
            fontFamily: "FreshMulberryDemo",
            shadows: [
              Shadow(
                color: CustomColor.yellowPrimary.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 2),
          )],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 180,
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColor.yellowPrimary,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectGrid(List<ProjectUtils> projects, BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 900 ? 3 : 2;
          if (constraints.maxWidth < 600) crossAxisCount = 1;
          
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.9,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCardWidget(
                project: projects[index],
                onTap: () => _navigateToDetailScreen(context, projects[index]),
              );
            },
          );
        },
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context, ProjectUtils project) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return ProjectDetailScreen(project: project);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
