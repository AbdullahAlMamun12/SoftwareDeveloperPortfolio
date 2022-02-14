import 'package:flutter/material.dart';

double updateSidePaddingSize(Size size){
  double sidePadding = 0;

  if(size.width >= 1100){
    sidePadding = 20 + (size.width-1100)/2;
  }
  else {
    sidePadding = 20;
  }
  return sidePadding;
}