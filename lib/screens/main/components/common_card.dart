import 'package:flutter/material.dart';
import 'package:portfolio_app/utils/utils.dart';
class CommonCard extends StatelessWidget {
  const CommonCard({Key? key, required this.controller,this.child = const  SizedBox()}) : super(key: key);
  final ScrollController controller;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      controller: controller,
      child: Card(
          margin: EdgeInsets.only(right: updateSidePaddingSize(size),left: updateSidePaddingSize(size),top: AppBar().preferredSize.height+50 ,bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: child
      ),
    );
  }
}
