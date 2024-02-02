

import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  EdgeInsets padding;
  final String helpText;
  bool isSecure = false;
  void Function(String)? onChanged;
  final FocusNode? focusNode;

  TextInputField(
    this.label, {
    Key? key,
    required this.controller,
    this.padding = const EdgeInsets.only(top: 8, bottom: 8),
    this.helpText = "",
    required this.isSecure,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        obscureText:
            widget.isSecure ? this.isPasswordVisible = true : widget.isSecure,
        controller: widget.controller,
        focusNode: widget.focusNode, // Attach the provided FocusNode
        decoration: getInputDecoration(),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: widget.onChanged,
      ),
    );
  }

  InputDecoration getInputDecoration() {
    return InputDecoration(
      labelText: widget.label,
      labelStyle: Theme.of(context).textTheme.bodyMedium,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 1,
        ),
      ),
      fillColor: Colors.black,
      hintText: widget.helpText,
      suffixIcon: isPasswordVisible
          ? IconButton(
              color: Colors.black,
              icon: Icon(
                widget.isSecure ? Icons.visibility : Icons.visibility_off,
                color: widget.isSecure ?Colors.black:Colors.blueAccent,
              ),
              onPressed: () {
                setState(() {
                  widget.isSecure = !widget.isSecure;
                });
              },
            )
          : null, // Hide suffixIcon when not a password field
    );
  }
}
