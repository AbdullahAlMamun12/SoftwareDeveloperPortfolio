import 'package:flutter/material.dart';

import '../../../constants.dart';
class MobileTabAppBar extends StatelessWidget {
  const MobileTabAppBar({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
            scaffoldKey.currentState!.openDrawer();
          }, icon: const Icon(Icons.menu),color: Colors.white,)
        ],),
      ),
    );
  }
}
