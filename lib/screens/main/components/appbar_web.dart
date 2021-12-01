import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/data/app_data.dart';
import 'package:portfolio_app/screens/main/components/appbar_nav_button.dart';

class WebAppBar extends StatelessWidget{
  WebAppBar({Key? key}) : super(key: key);
  var isBgColor = true.obs;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(()=>Container(
      height: isBgColor.value?AppBar().preferredSize.height:AppBar().preferredSize.height*50,
      width: size.width,
      decoration: BoxDecoration(
        color: isBgColor.value?Colors.white:Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, -5)
          ),
        ],
      ),
      padding:const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
      child: Row(children:[
        const Text("Abdullah Al Mamun"),
        const Spacer(),
        Row(
          children: List.generate(
              navItemList.length,
              (index) => NavButton(title: navItemList[index],isActive: true,)).toList(),
        ),
      ],),
    ));
  }
}
