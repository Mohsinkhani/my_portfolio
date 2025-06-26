import 'package:flutter/material.dart';
import 'package:myportfolio/utils/project_utils.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectUtils project;
  final Function() onTap;

  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool _isHovered = false;
  double _cardElevation = 4;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
        _cardElevation = 8;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
        _cardElevation = 4;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuad,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -10.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: _cardElevation * 2,
                spreadRadius: _cardElevation * 0.5,
                offset: Offset(0, _cardElevation),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Hero(
                  tag: widget.project.title,
                  child: Image.asset(
                    widget.project.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.project.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isHovered ? 1 : 0.8,
                        child: Text(
                          widget.project.subtitle,
                          maxLines: _isHovered ? 3 : 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          if (widget.project.androidLink != null)
                            const Icon(Icons.android, color: Colors.white),
                          if (widget.project.iosLink != null)
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.phone_iphone, color: Colors.white),
                            ),
                          if (widget.project.weblink != null)
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.language, color: Colors.white),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}