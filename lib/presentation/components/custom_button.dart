import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.text,required this.onPressed});
final String text;
VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent[100]
      ),
      onPressed:onPressed,
      child:  Text(text),
    );
  }
}
