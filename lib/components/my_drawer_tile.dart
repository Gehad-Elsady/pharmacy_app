import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? ontap;
  const MyDrawerTile(this.text, this.icon, this.ontap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(color: Colors.teal),
        ),
        leading: Icon(icon, color: Colors.teal[900]),
        onTap: ontap,
      ),
    );
  }
}
