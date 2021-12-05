import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key, this.child=const SizedBox()}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(40),
        width: double.infinity,
        decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10), ),
            color: Colors.white,
            image:DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/sp_main_bg.png")
            )
        ),
        child: child,
    );
  }



}
