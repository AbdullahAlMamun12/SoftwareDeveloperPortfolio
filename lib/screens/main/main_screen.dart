import 'package:flutter/material.dart';
import 'package:portfolio_app/responsive.dart';
import 'package:portfolio_app/screens/components/side_menu.dart';
import 'package:portfolio_app/screens/home/home.dart';
import 'package:portfolio_app/screens/main/components/appbar_mobile_tab.dart';
import 'package:portfolio_app/screens/main/components/appbar_web.dart';

import '../../constants.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cMainBgColor,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenu(),
      ),
      key: _scaffoldKey,
            // appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_bg.png"),
            fit: BoxFit.cover
          )
        ),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Responsive(
                mobile: MobileTabAppBar(scaffoldKey: _scaffoldKey,),
                tablet:MobileTabAppBar(scaffoldKey: _scaffoldKey,),
                desktop: WebAppBar(),
              )
            ),
          ],
        ),
      ),
    );
  }
}
