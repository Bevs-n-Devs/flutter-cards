import 'package:cards_table/resources/socket_methods.dart';
import 'package:cards_table/responsive/responsive.dart';
import 'package:cards_table/screens/card_table_screen.dart';
import 'package:cards_table/utils/colors.dart';
import 'package:cards_table/widgets/custom_button.dart';
import 'package:cards_table/widgets/custom_text.dart';
import 'package:cards_table/widgets/custom_text_fld.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BringTableScreen extends StatefulWidget {
  static String routeName = '/bring-table';
  const BringTableScreen({super.key});

  @override
  State<BringTableScreen> createState() => _BringTableScreenState();
}

class _BringTableScreenState extends State<BringTableScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();


  @override
  void initState() {
    super.initState();
    _socketMethods.createTableSuccessListener(context);
  }
  
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
                text: 'Enter Table Name', 
                shadows: [
                  Shadow(
                    blurRadius: 5, 
                    color: txtColor1
                  )
                ], 
                fontSize: 50
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextFld(controller: _nameController, hintText: "Put a Name on Your Table"),
              SizedBox(height: size.height * 0.02),
              CustomButton(onTap: () => _socketMethods.makeTable(_nameController.text), text: "Join Table", width: size.width)
            ],
          ),
        ),
      )
    );
  }
}