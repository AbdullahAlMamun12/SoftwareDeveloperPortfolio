import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text("Abdullah Al Mamun",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
          const Spacer(),
          IconButton(onPressed: (){
            scaffoldKey.currentState!.openDrawer();
          }, icon: const Icon(Icons.menu),color: Colors.white,)
        ],),
      ),
    );
  }
}
