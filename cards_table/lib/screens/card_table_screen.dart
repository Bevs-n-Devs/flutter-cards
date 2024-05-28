import 'dart:js';

import 'package:cards_table/provider/table_data_provider.dart';
import 'package:cards_table/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTableScreen extends StatefulWidget {
  static String routeName = '/card-table';
  const CardTableScreen({super.key});

  @override
  State<CardTableScreen> createState() => _CardTableScreenState();
}

class _CardTableScreenState extends State<CardTableScreen> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<TableDataProvider>(context).tableData.toString();
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Text(
          Provider.of<TableDataProvider>(context).tableData.toString(),
          style: const TextStyle(
            color: txtColor1,
          ),
        )
      )
    );
  }
}