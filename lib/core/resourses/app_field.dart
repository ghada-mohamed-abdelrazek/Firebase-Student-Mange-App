import 'dart:ui';

import 'package:flutter/material.dart';

class AppField extends StatelessWidget {
  AppField({
    super.key, this.obsureText = false, required this.hintText,required this.endIcon, this.controller
  });

  final bool obsureText;
  final String hintText;
  final TextEditingController?controller;
  Widget endIcon;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText: obsureText,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade200)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:  Colors.blue)
        ),

        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900)
        ),
        hintStyle: TextStyle(
            color: Colors.grey.shade400),
        hintText: hintText,

      ),


    );
  }
}