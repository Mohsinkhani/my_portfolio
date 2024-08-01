import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/skills_item.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //plateform
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int i = 0; i < plateformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff424657).withOpacity(0.9),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(5, 5), // changes position of shadow
                      ),
                    ],
                    color: CustomColor.bglight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    leading: Image.asset(plateformItems[i]["img"]),
                    title: Text(plateformItems[i]["title"],style: TextStyle(fontFamily: "FreshMulberryDemo"),),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (int i = 0; i < skillsItem.length; i++)
                  HoverContainer(
                    child: Chip(
                    
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      backgroundColor: CustomColor.bglight2,
                      label: Text(skillsItem[i]["title"],style: TextStyle(fontFamily: "FreshMulberryDemo"),),
                      avatar: Image.asset(skillsItem[i]["img"],),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class HoverContainer extends StatefulWidget {
  final Widget child;

  const HoverContainer({Key? key, required this.child}) : super(key: key);

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  void _toggleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isHovered ? 120 : 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff424657).withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
          color: _isHovered ? Colors.orange : CustomColor.bglight2,
          borderRadius: BorderRadius.circular(_isHovered ? 10 : 5),
        ),
        child: widget.child,
      ),
    );
  }
}

class HoverChip extends StatefulWidget {
  final String label;
  final Widget avatar;

  const HoverChip({Key? key, required this.label, required this.avatar}) : super(key: key);

  @override
  _HoverChipState createState() => _HoverChipState();
}

class _HoverChipState extends State<HoverChip> {
  bool _isHovered = false;

  void _toggleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.orange : CustomColor.bglight2,
          borderRadius: BorderRadius.circular(_isHovered ? 10 : 5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.avatar,
            SizedBox(width: 8),
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 300),
              style: TextStyle(
                fontFamily: "FreshMulberryDemo",
                color: _isHovered ? Colors.black : Colors.white,
                fontSize: _isHovered ? 18 : 16,
              ),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }}