import 'package:cards_table/resources/socket_methods.dart';
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
  final TextEditingController _tableIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  void showCardTable(BuildContext context) {
    Navigator.pushNamed(context, CardTableScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.joinTableSuccessListener(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _tableIdController.dispose();
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
                text: "Enter your nickname & the table ID", 
                shadows: [
                  Shadow(
                    blurRadius: 5, 
                    color: txtColor1
                  )
                ], 
                fontSize: 50
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextFld(controller: _nameController, hintText: "What's you nickname"),
              SizedBox(height: size.height * 0.02),
              CustomTextFld(controller: _tableIdController, hintText: "What's the Table ID"),
              SizedBox(height: size.height * 0.03),
              CustomButton(onTap: () => _socketMethods.jumpOnTable(
                _nameController.text,
                _tableIdController.text
              ), text: "Jump on Table", width: size.width)
            ],
          ),
        ),
      )
    );
  }
}