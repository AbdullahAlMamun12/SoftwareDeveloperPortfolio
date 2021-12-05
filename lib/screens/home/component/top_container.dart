import 'package:flutter/material.dart';
import '../../../constants.dart';
class TopContainer extends StatelessWidget {
 const TopContainer({Key? key,this.child = const SizedBox()}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
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
