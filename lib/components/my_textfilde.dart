import 'package:flutter/material.dart';

class MyTextFilde extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  final GestureDetector? decoration;
  const MyTextFilde(this.controller, this.hintText, this.obscureText, this.icon,
      {this.decoration, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        // height: 300,
        width: 500,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(30.0)),
              hintText: hintText,
              prefixIcon: icon,
              suffixIcon: decoration),
        ),
      ),
    );
  }
}
