import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';

class NavButton extends StatefulWidget {
  const NavButton({Key? key, this.title = "title", this.isActive = false, this.onTap})
      : super(key: key);
  final String title;
  final bool isActive;
  final Function()? onTap;
  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHover = false;
  double indicatorSize = 0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.copy,
      child: InkWell(
        onHover: (value){
          setState(() {
            // debugPrint(value.toString());
            if(value) {
              indicatorSize = 25;
            } else {
              indicatorSize = 0;
            }
            isHover = value;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title,style: TextStyle(color: widget.isActive||isHover?Colors.black:Colors.grey),),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 2,
                width: widget.isActive?25:indicatorSize,
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color: widget.isActive||isHover?cMainColor:Colors.transparent
                ),
              )
            ],
          ),
        ),
        onTap: (){
          if(widget.onTap!=null) {
            widget.onTap!();
            setState(() {
              indicatorSize = 25;
            });
          }
        },
      ),
    );
  }
}

