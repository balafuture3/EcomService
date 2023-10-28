
import 'package:flutter/material.dart';

class CustomSnackBar {
  BuildContext context;
  String displaytext;
  int duration;
  Color color;
  CustomSnackBar(this.context,this.displaytext,this.duration,this.color){
       ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(displaytext),
      duration: Duration(seconds: duration),
      backgroundColor:color,
    ));

}}
