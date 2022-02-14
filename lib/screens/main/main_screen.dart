import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/constraints/screen_type.dart';
import 'package:portfolio_app/controller/ui_contorller.dart';
import 'package:portfolio_app/responsive.dart';
import 'package:portfolio_app/screens/appbar/side_menu.dart';
import 'package:portfolio_app/screens/home/home.dart';
import 'package:portfolio_app/screens/main/components/appbar_mobile_tab.dart';
import 'package:portfolio_app/screens/appbar/appbar_web.dart';
import 'package:portfolio_app/screens/resume/resume_screen.dart';

import '../../constants.dart';

class MainScreen extends GetView<UiController> {
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenu(),
      ),
      key: _scaffoldKey,
      body: Container(
    decoration: BoxDecoration(
          color: Colors.grey.shade200,
          image: const DecorationImage(
              image: AssetImage("assets/images/main_bg.png"),
              fit: BoxFit.fill
          )
      ),
        child: Stack(children: [
          SizedBox(
              height: size.height,
              width: size.width,
              child: Obx(()=>AnimatedSwitcher(
                duration: const Duration(milliseconds: 1500),
                child: getBodyContent(),
                transitionBuilder: (child,animation)=>getTransaction(child,animation,size),
              )),
            ),
          SafeArea(
            child: Responsive(
              mobile: MobileTabAppBar(scaffoldKey: _scaffoldKey,),
              tablet:MobileTabAppBar(scaffoldKey: _scaffoldKey,),
              desktop: WebAppBar(),
            ),
          ),
        ],),
      )
    );
  }

  getBodyContent() {
    if(controller.screenType.value == MainScreenType.HOME) {
      return const HomeScreen();
    } else if(controller.screenType.value == MainScreenType.RESUME) {
      return const ResumeScreen();
    }else {
      return const SizedBox();
    }
  }

  getTransaction(Widget child, Animation<double> animation, Size size) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    List<Widget> transitionList = [
      ScaleTransition(scale: animation,child: child,),
      RotationTransition(turns: animation, child: child,),
      RelativePositionedTransition(size: size,
        rect: RectTween(
          begin:  Rect.fromLTWH(0, 0, 60, 40),
          end: Rect.fromLTWH(1, 1, size.width, size.height),
        ).animate(animation),
        child: child,),
    ];
    return transitionList[Random().nextInt(3)];

    // return RelativePositionedTransition(size: size,
    //   rect: RectTween(
    //     begin:  Rect.fromLTWH(0, 0, 60, 40),
    //     end: Rect.fromLTWH(1, 1, size.width, size.height),
    //   ).animate(animation),
    //   child: child,);
  }
}
