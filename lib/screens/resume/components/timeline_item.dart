import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/constants.dart';

class TimeLineItem extends StatelessWidget {
  const TimeLineItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: cMainColor, width: 2),
                        color: Colors.white),
                    height: 15,
                    width: 15,
                  ),
                  Container(
                    color: cMainColor,
                    height: 2,
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: const Border(
                      left: BorderSide(color: cMainColor, width: 2.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        spreadRadius: -2,
                        blurRadius: 5)
                  ]),
              // height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Specialization Course",style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(children: [
                      Text("2010",style: GoogleFonts.montserrat(fontSize: 12,color: cMainColor),),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 15,
                        width: 1,
                        color: Colors.grey[300],
                      ),
                      Text("Apple Inc.",style: GoogleFonts.montserrat(fontSize: 12,color: Colors.grey[300]),),

                    ],),
                  ),
                  Text("Mauris magna sapien, pharetra consectetur fringilla vitae, interdum sed tortor.",style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
