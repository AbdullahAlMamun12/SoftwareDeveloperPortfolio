import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_app/controller/ui_contorller.dart';
import 'package:portfolio_app/screens/components/side_menu.dart';
import 'package:portfolio_app/screens/home/component/bottom_container.dart';
import 'package:portfolio_app/screens/home/component/top_container.dart';
import 'package:portfolio_app/utils/url_luncher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../../responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextStyle? robotoTextStyle;
  Size? size ;
  ScrollController controller = ScrollController();
  var uiController = Get.find<UiController>();

  @override
  void initState() {
    controller.addListener((){

      if(controller.position.pixels>30){
        uiController.isActiveAppBarBgColor.value = true;
      }
      else{
        uiController.isActiveAppBarBgColor.value = false;
        // debugPrint("==>"+controller.position.pixels.toString());
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    robotoTextStyle = GoogleFonts.roboto(
        fontSize: Responsive.isMobile(context)?14:15,
        fontWeight: FontWeight.w400
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  SingleChildScrollView(
        controller: controller,
        child: Card(
        margin: EdgeInsets.only(right: updateSidePaddingSize(),left: updateSidePaddingSize(),top: AppBar().preferredSize.height+50 ,bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Column(
             children: [
               TopContainer(
                 child: Responsive.isMobile(context)  || size!.width < 845
                     ? Column(children: [
                   photo(),
                   const SizedBox(height: 20),
                   title(),
                 ])
                     : Row(
                   // runSpacing: 20,
                   // spacing: 20,
                   // crossAxisAlignment: WrapCrossAlignment.center,
                   // alignment: WrapAlignment.center,
                   children: [
                     const Expanded(
                       child: SizedBox(height: 220),
                       flex: 5,
                     ),
                     // const SizedBox(width: 20,),
                     // const Spacer(),
                     Expanded(
                       child: title(),
                       flex: 11,),
                   ],
                 ),
               ),
               BottomContainer(
                 child: Responsive.innerResponsive(
                   context: context,
                   mobile: Column(
                     children: [
                       about(),
                       const SizedBox(height: 20),
                       details(robotoTextStyle!),
                     ],
                   ),
                   tablet: Row(
                     children: [
                       Expanded(
                           flex:  size!.width > 710 ? 8 : 7,
                           child: about()
                       ),
                       const SizedBox(width:20),
                       Expanded(
                         flex: size!.width >= 650 ? 10 : 8,
                         child: details(robotoTextStyle!),
                       ),
                     ],
                   ),
                   desktop:  Row(
                     children: [
                       Expanded(
                           flex: 8 ,
                           child: about()
                       ),
                       const SizedBox(width:20),
                       Expanded(
                         flex: 8 ,
                         child: details(robotoTextStyle!),
                       ),
                     ],
                   ),
                 ),
               ),
           ],),
            if(Responsive.isTablet(context) && size!.width > 845 || Responsive.isDesktop(context))
              Obx((){
                return AnimatedPositioned(
                  duration:const Duration(milliseconds: 250),
                  top: uiController.isHoverProfileImage.value?30:40,
                  left: 40,
                  child: photo(),
                );
              })
          ],)
      ),
      ),
    );
  }

  Widget photo(){
    return MouseRegion(
      onExit: (_){
        uiController.isHoverProfileImage.value = false;
      },
      onEnter: (_){uiController.isHoverProfileImage.value = true;},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600.withOpacity(.3),
              offset: const Offset(0,5),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ]
        ),
        width: updateImageSize(),
        height: updateImageSize(),
        padding:const EdgeInsets.all(5),
        // margin: EdgeInsets.only(right:  Responsive.isMobile(context)?0:40,bottom:  Responsive.isMobile(context)?40:0),
        child: Image.asset(
          "assets/images/photo.png",
          // height:updateImageSize(),
          // width:updateImageSize(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget title(){
    return Container(
      // color: Colors.red,
      // margin: const EdgeInsets.all(45),
      // height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Abdullah Al Mamun",style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: Responsive.isMobile(context)?25:Responsive.isTablet(context)?40:52,
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
                onPressed: onLinkedinClick,
                style: ElevatedButton.styleFrom(
                  shape:const CircleBorder(),
                  padding:EdgeInsets.all( Responsive.isMobile(context) ? 10:15),
                ).copyWith(backgroundColor: MaterialStateProperty.all(Colors.white),).copyWith(),
                child:FaIcon(FontAwesomeIcons.linkedinIn,color: Colors.grey[400],),
              ),
              ElevatedButton(
                onPressed:onFaceBookClick,
                style: ElevatedButton.styleFrom(
                    shape:const CircleBorder(),
                    padding:EdgeInsets.all( Responsive.isMobile(context) ? 10:15)
                ).copyWith(backgroundColor: MaterialStateProperty.all(Colors.white),),
                child:FaIcon(FontAwesomeIcons.facebookF,color: Colors.grey[400],),
              ),
              ElevatedButton(
                onPressed: (){AppUrlLauncher().launchGithub();},
                style: ElevatedButton.styleFrom(
                  shape:const CircleBorder(),
                  padding:EdgeInsets.all( Responsive.isMobile(context) ? 10:15),
                ).copyWith(backgroundColor: MaterialStateProperty.all(Colors.white),),
                child:FaIcon(FontAwesomeIcons.github,color: Colors.grey[400],),
              ),
            ],),
          if(Responsive.isMobile(context))
            SizedBox(height: 40,),
        ],),
    );
  }
  Widget about(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: 'Abdullah ',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              children: [
                TextSpan(
                    text: 'Al-Mamun',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: cMainColor,
                    ))
              ]),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20,),
        Text(
          "Hello! I’m Abdullah Al-Mamun. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fermentum ullamcorper sem, at placerat dolor volutpat ac. Duis nulla enim, condimentum nec ultricies.",
          style: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w400
          ),),
        const SizedBox(height: 20,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              primary: Colors.white).copyWith(padding: MaterialStateProperty.all(const EdgeInsets.all(20))),
          onPressed: () {},
          child: Text("DOWNLOAD RESUME",
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color(0xff212121),
                      fontSize: 14,
                      fontWeight: FontWeight.w500))),
        ),
      ],);
}
  Widget details(TextStyle robotoTextStyle){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Age ", style: robotoTextStyle),
            const SizedBox(height: 12),
            Text("Residence ", style: robotoTextStyle),
            const SizedBox(height: 12),
            Text("Address ", style: robotoTextStyle),
            const SizedBox(height: 12),
            Text("e-mail ", style: robotoTextStyle),
            const SizedBox(height: 12),
            Text("Phone ", style: robotoTextStyle),
            const SizedBox(height: 12),
            Text("Freelance ", style: robotoTextStyle),
          ],),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(calculateAge(DateFormat('dd-MM-yyyy').parse("08-12-1997")).toString(), style: robotoTextStyle.copyWith(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("Bangladesh", style: robotoTextStyle.copyWith(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("Tejgaon, Dhaka-1208", style: robotoTextStyle.copyWith(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("al-mamun12@hotmail.com", style: robotoTextStyle.copyWith(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("+8801625695712", style: robotoTextStyle.copyWith(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("Available ", style: robotoTextStyle.copyWith(color: Colors.grey)),
          ],),

      ],);
}

  double updateImageSize(){
    double imageSize= 0 ;
    double extraSize = 194 + (size!.width - 800) / 5;
    if(extraSize > 284){
      imageSize = 284;
    }
    else if( extraSize < 194){
      imageSize =194;
    }
    else{
      imageSize = extraSize;
    }
    return imageSize;
  }
  double updateSidePaddingSize(){
    double sidePadding = 0;

    if(size!.width >= 1100){
      sidePadding = 20 + (size!.width-1100)/2;
    }
    else {
      sidePadding = 20;
    }
    return sidePadding;
  }
  void onFaceBookClick(){
    AppUrlLauncher().launchFacebook();
  }
  void onLinkedinClick() {
    AppUrlLauncher().launchLinkedin();
  }
  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}

