import 'package:cards_table/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFld extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  const CustomTextFld({super.key, required this.controller, required this.hintText, this.isReadOnly=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: txtColor1,
            spreadRadius: 0
          )
        ] 
      ),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        cursorColor: txtColor1,
        decoration: InputDecoration(
          fillColor: bgColor,
          filled: true,
          
          focusColor: txtColor1,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.blueGrey)
        ),
        style: const TextStyle(
          color: txtColor1
        ),
      )
    );
  }
}