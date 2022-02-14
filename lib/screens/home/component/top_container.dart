import 'package:flutter/material.dart';
import '../../../constants.dart';
class TopContainer extends StatelessWidget {
 const TopContainer({Key? key,this.child = const SizedBox(),this.sidePadding = 40}) : super(key: key);
  final Widget child;
  final double sidePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sidePadding),
      width: double.infinity,
      decoration:BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10), ),
          color: cMainColor.withOpacity(.8),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/sp_main_bg.png")
          )
      ),
      child: child,
    );
  }
}
