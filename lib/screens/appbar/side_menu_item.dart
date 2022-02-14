import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';


class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    this.isActive,
    this.isHover = false,
    this.itemCount,
    this.showBorder = true,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final bool? isActive, isHover, showBorder;
  final int? itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: cDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive! || isHover!)
                ? WebsafeSvg.asset(
                    "assets/Icons/Angle right.svg",
                    width: 15,
                  )
                : const SizedBox(width: 15),
            const SizedBox(width: cDefaultPadding / 4),
            Expanded(
              child: Container(
                padding:const EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder!
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      iconSrc,
                      height: 20,
                      color: (isActive! || isHover!) ? cPrimaryColor : cGrayColor,
                    ),
                    const SizedBox(width: cDefaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color:
                                (isActive! || isHover!) ? cTextColor : cGrayColor,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
