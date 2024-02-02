import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClick;
  // Function( ) onClick;  another way
  Color background;
  String text;
  double radius;
  Color textcolor;

  CustomButton(
      {Key? key,
      required this.onClick,
      required this.background,
      required this.text,
      required this.radius,
      required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ));
  }
}
