
import 'package:flutter/material.dart';
import '../values/dimensions.dart';
import '../values/strings.dart';

class CustomeditText extends StatelessWidget {
  TextEditingController controller;
  IconData icondata;
  String labeltext;
  Function(String value) onChanged;
  String? errortext;
  CustomeditText({Key? key,required ,required this.controller,required this.icondata,required this.labeltext,required this.onChanged,required this.errortext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      onChanged:onChanged,

      decoration:  InputDecoration(
        helperText: "",
        errorText: errortext,
          prefixIcon: Icon(icondata),
          labelText: labeltext,
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.border_rect)))),
    );
  }
}
