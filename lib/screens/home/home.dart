import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/connect.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/screens/components/side_menu.dart';

import '../../constants.dart';
import '../../responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  Responsive.isDesktop(context)?cDefaultPadding*5:20),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10), ),
                color: cMainColor.withOpacity(.8),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/sp_main_bg.png")
                )
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(40),
                    child: Image.asset("assets/images/photo.png",height: 220,),

                  ),
                  Container(
                    // color: Colors.red,
                    // margin: const EdgeInsets.all(45),
                    // height: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Abdullah Al Mamun",style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Responsive.isMobile(context)?25:54,
                        fontWeight: FontWeight.w700
                      ),),
                      const SizedBox(height: 20,),
                      Text("Software Engineer",style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18
                      ),),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape:const CircleBorder(),
                              padding:const EdgeInsets.all(10),
                            ).copyWith(backgroundColor: MaterialStateProperty.all(Colors.white),).copyWith(),
                            child:FaIcon(FontAwesomeIcons.twitter,color: Colors.grey[400],),
                          ),
                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape:const CircleBorder(),
                              padding:const EdgeInsets.all(10)
                            ).copyWith(backgroundColor: MaterialStateProperty.all(Colors.white),),
                            child:FaIcon(FontAwesomeIcons.facebook,color: Colors.grey[400],),
                          ),
                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape:const CircleBorder(),
                              padding:const EdgeInsets.all(10)
                            ).copyWith(backgroundColor: MaterialStateProperty.all(Colors.white),),
                            child:FaIcon(FontAwesomeIcons.instagram,color: Colors.grey[400],),
                          ),
                      ],),
                        // if(Responsive.isMobile(context))
                          SizedBox(height: 40,),
                    ],),
                  )
                ],
              ),
            ),




            Container(
              margin: const EdgeInsets.only(bottom: 50),
              width: double.infinity,
              decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10), ),
                  color: Colors.white,
                  image:DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/sp_main_bg.png")
                  )
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    // color: Colors.red,
                    // margin: const EdgeInsets.all(45),
                    height: 590,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      ],),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

