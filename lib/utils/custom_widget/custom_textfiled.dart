import 'package:flutter/material.dart';

import '../custom_color/custom_color.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, required this.hintText,required this.controller});
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            filled: true,
            fillColor: arrowColor,
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            hintText: hintText),
      ),
    );
  }
}
