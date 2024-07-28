import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/size.dart';
import 'package:myportfolio/constants/sns_links.dart';
import 'package:myportfolio/widgets/text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bglight1,
      child: Column(
        children: [
          Text(
            "Get in touch",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
              child: LayoutBuilder(builder: (context, Constraints) {
                if (Constraints.maxWidth > MinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }
                //else
                return buildNameEmailFieldMobile();
              })),
          const SizedBox(
            height: 15,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const CustomeTextField(
              hintText: "Your message",
              maxLines: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //send button
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColor.yellowPrimary)),
                    onPressed: () {},
                    child: const Text(
                      "Get in touch",
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
          const SizedBox(
            height: 15,
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Divider()),
          const SizedBox(
            height: 15,
          ),
          //sns icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    js.context.callMethod("open", [SnsLinks.github]);
                  },
                  child: Image.asset(
                    "assets/images/github.jpg",
                    width: 28,
                  )),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.instagram]);
                },
                child: Image.asset(
                  "assets/images/instagram.jpg",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.facebook]);
                },
                child: Image.asset(
                  "assets/images/facebook.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.whatsapp]);
                },
                child: Image.asset(
                  "assets/images/whatsapp.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.linkdin]);
                },
                child: Image.asset(
                  "assets/images/linkdin.png",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(child: CustomeTextField(hintText: "Your name")),
        SizedBox(
          width: 15,
        ),
        Flexible(child: CustomeTextField(hintText: "Your email")),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(child: CustomeTextField(hintText: "Your name")),
        SizedBox(
          height: 15,
        ),
        Flexible(child: CustomeTextField(hintText: "Your email")),
      ],
    );
  }
}
