
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;

  const CustomTextfield({
    Key? key, required this.icon, required this.obscureText, required this.hintText, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: textColor?.withOpacity(.3),),
        hintText: hintText,
        hintStyle: TextStyle(color: textColor?.withOpacity(.5)),
      ),
      cursorColor: textColor?.withOpacity(.5),
    );
  }
}