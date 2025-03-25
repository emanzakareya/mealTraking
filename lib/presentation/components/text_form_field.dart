import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({super.key, required this.labelText,required this.controller, required this.keyboardType});
 TextEditingController controller;
 TextInputType keyboardType;
 final String labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: controller,
              decoration:  InputDecoration(labelText: labelText),
              keyboardType: keyboardType,
            );
  }
}