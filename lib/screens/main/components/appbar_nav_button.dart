import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';

class NavButton extends StatelessWidget {
  const NavButton({Key? key, this.title = "title", this.isActive = false})
      : super(key: key);
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(title,style: TextStyle(color: isActive?Colors.black:Colors.grey),),
          Container(
            height: 2,
            width: 25,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isActive?cMainColor:Colors.transparent
            ),
          )
        ],
      ),
    );
  }
}
