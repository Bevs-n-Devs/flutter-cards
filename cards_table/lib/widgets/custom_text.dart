import 'package:cards_table/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontSize;
  const CustomText({super.key, required this.text, required this.shadows, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: txtColor1,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        shadows: shadows
      ),
    );
  }
}