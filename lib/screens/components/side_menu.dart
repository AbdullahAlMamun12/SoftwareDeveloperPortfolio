import 'package:flutter/material.dart';
import 'package:portfolio_app/extensions.dart';
import 'package:websafe_svg/websafe_svg.dart';


import 'package:flutter/foundation.dart' show kIsWeb;

import '../../constants.dart';
import '../../responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: kIsWeb ? cDefaultPadding : 0),
      color: cMainColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Container(decoration:const BoxDecoration(
                    shape:BoxShape.circle,
                    // borderRadius: BorderRadius.circular(100),
                    image:  DecorationImage(
                      image: AssetImage(
                        "assets/images/photo.png",),
                      fit: BoxFit.cover,
                    ),
                  ),
                    height: 100,
                    width: 100,
                  ).addNeumorphismCircle(),
                  const Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) const CloseButton(color: Colors.white,),
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
                color: cMainColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                label: const Text(
                  "Home",
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
                color: cMainColor,
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
                color: cMainColor,
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
                color: cMainColor,
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
                color: cMainColor,
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
                color: const Color(0xFF2eca7f),
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
