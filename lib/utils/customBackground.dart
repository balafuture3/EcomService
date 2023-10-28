
import 'package:flutter/material.dart';

class CustomBackground extends StatefulWidget {
  Widget child;
  CustomBackground({Key? key,required this.child}) : super(key: key);

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}


class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/background1.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child:widget.child
    );
  }
}

