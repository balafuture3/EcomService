import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final bool enable;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  Button(this.label,
      this.enable,
      {Key? key,
      required this.onPressed,
      this.color = Colors.blue,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: enable? Colors.blue:Colors.grey,
          gradient:enable? LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade600,
              Colors.blue.shade400,
              Colors.blue.shade100,
            ],
          ):null),
      // margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: enable?onPressed:null,
        style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            // backgroundColor: Colors.Blue,
            textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            )),
        child: Text(label),
      ),
    );
  }
}
