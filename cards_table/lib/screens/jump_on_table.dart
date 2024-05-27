import 'package:cards_table/responsive/responsive.dart';
import 'package:cards_table/screens/card_table_screen.dart';
import 'package:cards_table/utils/colors.dart';
import 'package:cards_table/widgets/custom_button.dart';
import 'package:cards_table/widgets/custom_text.dart';
import 'package:cards_table/widgets/custom_text_fld.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JumpOnTableScreen extends StatefulWidget {
  static String routeName = '/jump-on-table';
  const JumpOnTableScreen({super.key});

  @override
  State<JumpOnTableScreen> createState() => _JumpOnTableScreenState();
}

class _JumpOnTableScreenState extends State<JumpOnTableScreen> {
  final TextEditingController _nameController = TextEditingController();

  void showCardTable(BuildContext context) {
    Navigator.pushNamed(context, CardTableScreen.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: "Enter table name & the secret phrase", 
                shadows: [
                  Shadow(
                    blurRadius: 5, 
                    color: txtColor1
                  )
                ], 
                fontSize: 50
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextFld(controller: _nameController, hintText: "What's you table name"),
              SizedBox(height: size.height * 0.02),
              CustomTextFld(controller: _nameController, hintText: "What's the secret phrase"),
              SizedBox(height: size.height * 0.03),
              CustomButton(onTap: () => showCardTable(context), text: "Join Table", width: size.width)
            ],
          ),
        ),
      )
    );
  }
}