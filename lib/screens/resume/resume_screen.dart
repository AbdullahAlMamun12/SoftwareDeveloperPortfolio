import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/controller/ui_contorller.dart';
import 'package:portfolio_app/responsive.dart';
import 'package:portfolio_app/screens/home/component/bottom_container.dart';
import 'package:portfolio_app/screens/home/component/top_container.dart';
import 'package:portfolio_app/screens/main/components/common_card.dart';
import 'package:portfolio_app/screens/resume/components/timeline_item.dart';
import 'package:portfolio_app/utils/utils.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
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
    final size = MediaQuery.of(context).size;
    return CommonCard(
      controller: controller,
      child: Column(
        children: [
          TopContainer(
             sidePadding: 0,
            child: Padding(
              padding: EdgeInsets.all(Responsive.isMobile(context)?15:30),
              child: Center(
                  child: Text(
                "Resume",
                style: GoogleFonts.montserrat(
                    fontSize: Responsive.isMobile(context)?34:44,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
            ),
          ),
          BottomContainer(
              child: Responsive.innerResponsive(
            context: context,
            mobile: Column(
              children: [
                educationTimeline(),
                const SizedBox(height: 20,),
                experienceTimeline(),
              ],
            ),
            tablet: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: educationTimeline(),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  flex: 8,
                  child: experienceTimeline(),
                ),
              ],
            ),
            desktop:Row(
              children: [
                Expanded(
                  flex: 8,
                  child: educationTimeline(),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  flex: 8,
                  child: experienceTimeline(),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget educationTimeline(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 5),
          child: Text("Education",style: GoogleFonts.montserrat(fontSize: 21,fontWeight: FontWeight.w700,color: Colors.black),),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                width: 2,
                color: Colors.grey.shade300,
                height: 100000,
              ),
              top: 0,
              left: 6.5,
            ),
            Column(
              children: [
                TimeLineItem(),
                TimeLineItem(),
                TimeLineItem(),
                TimeLineItem(),
                TimeLineItem(),
              ],
            )
          ],
        ),
      ],
    );
  }
  Widget experienceTimeline(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 5),
          child: Text("Experience",style: GoogleFonts.montserrat(fontSize: 21,fontWeight: FontWeight.w700,color: Colors.black),),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                width: 2,
                color: Colors.grey.shade300,
                height: 100000,
              ),
              top: 0,
              left: 6.5,
            ),
            Column(
              children: [
                TimeLineItem(),
                TimeLineItem(),
                TimeLineItem(),
                TimeLineItem(),
                TimeLineItem(),
              ],
            )
          ],
        ),
      ],
    );
  }
}
