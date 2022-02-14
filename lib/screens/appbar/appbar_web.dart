import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/constraints/screen_type.dart';
import 'package:portfolio_app/controller/ui_contorller.dart';
import 'package:portfolio_app/data/app_data.dart';
import 'package:portfolio_app/screens/main/components/appbar_nav_button.dart';

import '../../constants.dart';

class WebAppBar extends GetView<UiController>{
  WebAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(()=>AnimatedContainer(
      duration:const Duration(milliseconds: 250),
      height: controller.isActiveAppBarBgColor.value?AppBar().preferredSize.height:AppBar().preferredSize.height+50,
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
          color: controller.isActiveAppBarBgColor.value?Colors.white:Colors.transparent,
          boxShadow: controller.isActiveAppBarBgColor.value ? [const BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, -5)
          )] : [const BoxShadow(
              color: Colors.transparent,
              blurRadius: 0,
              spreadRadius: 0,
              offset: Offset(0, 0)
          )] ,
        ),
        padding:const EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          children:[
            RichText(
              text: TextSpan(
                  text: 'Abdullah ',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  children: [
                    TextSpan(
                        text: 'Al-Mamun',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: cMainColor,
                        ))
                  ]),
            ),
            const Spacer(),
            Row(
              children: List.generate(
                  navItemList.length,
                      (index) => NavButton(title: navItemList[index],isActive: index==controller.activeNavButton.value?true:false,onTap: (){
                    controller.activeNavButton.value = index;
                    switch(index){
                      case 0 : controller.screenType.value = MainScreenType.HOME;
                      break;
                      case 1 : controller.screenType.value = MainScreenType.RESUME;
                      break;
                    }

                  },)).toList(),
            ),
          ],),
      ),
    ));
  }
}
