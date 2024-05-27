import 'package:cards_table/responsive/responsive.dart';
import 'package:cards_table/screens/card_table_screen.dart';
import 'package:cards_table/screens/bring_table_entry.dart';
import 'package:cards_table/screens/jump_on_table.dart';
import 'package:cards_table/screens/wait_for_table_screen.dart';
import 'package:cards_table/utils/colors.dart';
import 'package:cards_table/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  static String routeName = '/main-screen';
  const MainScreen({super.key});

  void jumpOnTable (BuildContext context) {
    Navigator.pushNamed(context, JumpOnTableScreen.routeName);
  }

  void waitForTable (BuildContext context) {
    Navigator.pushNamed(context, WaitForTableScreen.routeName);
  }
  
  void bringTable (BuildContext context) {
    Navigator.pushNamed(context, BringTableScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Responsive(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(onTap: () => bringTable(context), text: "Bring a Table", width: MediaQuery.of(context).size.width * 0.6),
                  const SizedBox(height: 20),
                  CustomButton(onTap: () => jumpOnTable(context), text: "Jump on a Table", width: MediaQuery.of(context).size.width * 0.6),
                  const SizedBox(height: 20),
                  CustomButton(onTap: () => waitForTable(context), text: "Wait for a Table", width: MediaQuery.of(context).size.width * 0.6),
                ],
              ),
            )
          ]
        )
      );
  }
}