import 'package:flutter/material.dart';
import 'package:portfolio_app/responsive.dart';
import 'package:portfolio_app/screens/components/side_menu.dart';
import 'package:portfolio_app/screens/home/home.dart';

import '../../constants.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                mobile: Container(
                  height: AppBar().preferredSize.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: cMainColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      const Text("Abdullah Al Mamun",style: TextStyle(color: Colors.white),),
                      const Spacer(),
                      IconButton(onPressed: (){
                        _scaffoldKey.currentState!.openDrawer();
                      }, icon: const Icon(Icons.menu),color: Colors.white,)
                    ],),
                  ),
                ),
                tablet:  Container(
                  height: 100,
                  width: size.width,
                ),
                desktop:  Container(
                  height: 100,
                  width: size.width,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
