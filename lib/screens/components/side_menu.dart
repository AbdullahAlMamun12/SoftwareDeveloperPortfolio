import 'package:flutter/material.dart';
import 'package:portfolio_app/extensions.dart';
import 'package:websafe_svg/websafe_svg.dart';


import 'package:flutter/foundation.dart' show kIsWeb;

import '../../constants.dart';
import '../../responsive.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: kIsWeb ? cDefaultPadding : 0),
      color: cBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Logo Outlook.png",
                    width: 46,
                  ),
                  const Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: cDefaultPadding),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: cDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: cBgDarkColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                label: const Text(
                  "Home",
                  style: TextStyle(color: cTextColor),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
              ),
              const SizedBox(height: cDefaultPadding * 1.5),
              FlatButton.icon(
                minWidth: double.infinity,
                padding:const EdgeInsets.symmetric(
                  vertical: cDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: cBgDarkColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                label: const Text(
                  "Resume",
                  style: TextStyle(color: cTextColor),
                ),
              ).addNeumorphism(),
              const SizedBox(height: cDefaultPadding * 1.5),
              FlatButton.icon(
                minWidth: double.infinity,
                padding:const EdgeInsets.symmetric(
                  vertical: cDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: cBgDarkColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                label: const Text(
                  "Service",
                  style: TextStyle(color: cTextColor),
                ),
              ).addNeumorphism(),
              const SizedBox(height: cDefaultPadding * 1.5),
              FlatButton.icon(
                minWidth: double.infinity,
                padding:const EdgeInsets.symmetric(
                  vertical: cDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: cBgDarkColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                label: const Text(
                  "Portfolio",
                  style: TextStyle(color: cTextColor),
                ),
              ).addNeumorphism(),
              const SizedBox(height: cDefaultPadding * 1.5),
              FlatButton.icon(
                minWidth: double.infinity,
                padding:const EdgeInsets.symmetric(
                  vertical: cDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: cBgDarkColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                label: const Text(
                  "Blog",
                  style: TextStyle(color: cTextColor),
                ),
              ).addNeumorphism(),
              const SizedBox(height: cDefaultPadding * 1.5),
              FlatButton.icon(
                minWidth: double.infinity,
                padding:const EdgeInsets.symmetric(
                  vertical: cDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: cBgDarkColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                label: const Text(
                  "Contact",
                  style: TextStyle(color: cTextColor),
                ),
              ).addNeumorphism(),


              const SizedBox(height: cDefaultPadding * 2),
              // Tags
            ],
          ),
        ),
      ),
    );
  }
}
