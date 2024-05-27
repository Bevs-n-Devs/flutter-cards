import 'package:cards_table/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  const CustomButton({super.key, required this.onTap, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: txtColor1,
            blurRadius: 5,
            spreadRadius: 0
          )
        ]
      ),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          backgroundColor: txtColor1,
          foregroundColor: bgColor,
          minimumSize: Size(width, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width*.005)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold)
        ),
        child: Text(text),
        )
      );
  }
}