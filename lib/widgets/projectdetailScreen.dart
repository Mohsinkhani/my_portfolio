import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';
class ProjectDetailScreen extends StatelessWidget {
  final ProjectUtils project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bglight1,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: project.title,
                child: Image.network(
                  project.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.subtitle,
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.whitePrimary.withOpacity(0.9),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTechStackSection(),
                  const SizedBox(height: 40),
                  _buildScreenshotsSection(),
                  const SizedBox(height: 40),
                  _buildPlatformLinks(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechStackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Technologies Used",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: project.techStack
              .map((tech) => Chip(
                    label: Text(tech),
                    backgroundColor: CustomColor.yellowPrimary.withOpacity(0.2),
                    labelStyle: TextStyle(color: CustomColor.whitePrimary),
                  ))
              .toList(),
        ),
      ],
    );
  }
Widget _buildScreenshotsSection() {
  final screenshots = project.screenshots;
  if (screenshots == null || screenshots.isEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Screenshots",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "No screenshots available.",
          style: TextStyle(
            color: CustomColor.whitePrimary.withOpacity(0.7),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Screenshots",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: CustomColor.whitePrimary,
        ),
      ),
      const SizedBox(height: 20),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
        ),
        itemCount: screenshots.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: 3,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _showFullScreenImage(context, screenshots[index]),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            CustomColor.bglight2.withOpacity(0.3),
                            CustomColor.bglight1.withOpacity(0.3),
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Hero(
                              tag: 'screenshot_${project.title}_$index',
                              child: Image.network(
                                screenshots[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.3),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 10,
                              right: 10,
                              child: Icon(
                                Icons.zoom_in,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}

void _showFullScreenImage(BuildContext context, String imageUrl) {
  Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.9),
          body: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  Navigator.pop(context);
                }
              },
              child: Hero(
                tag: 'screenshot_$imageUrl',
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 1,
                  maxScale: 4,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

  Widget _buildPlatformLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available On",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            if (project.androidLink != null)
              _buildLinkButton("Android", Icons.android, project.androidLink!),
            if (project.iosLink != null)
              _buildLinkButton("iOS", Icons.phone_iphone, project.iosLink!),
            if (project.weblink != null)
              _buildLinkButton("Web", Icons.language, project.weblink!),
          ],
        ),
      ],
    );
  }

  Widget _buildLinkButton(String label, IconData icon, String url) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColor.yellowPrimary,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: Icon(icon),
      label: Text(label),
      onPressed: () => launchUrl(Uri.parse(url)),
    );
  }
}