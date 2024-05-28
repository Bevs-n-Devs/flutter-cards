import 'package:flutter/material.dart';

/**
 * Show Error messages
 */
void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content
      )
    )
  );
}