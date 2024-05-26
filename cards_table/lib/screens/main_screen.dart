import 'package:cards_table/responsive/responsive.dart';
import 'package:cards_table/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  static String routeName = '/main-screen';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 26, 36),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Responsive(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(onTap: () {}, text: "Jump on a Table", width: MediaQuery.of(context).size.width * 0.6),
                  const SizedBox(height: 20),
                  CustomButton(onTap: () {}, text: "Wait for a Table", width: MediaQuery.of(context).size.width * 0.6),
                ],
              ),
            )
          ]
        )
      );
  }
}