import "package:cards_table/screens/main_screen.dart";
import "package:flutter/material.dart";


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cards Table App",
      routes: {
        MainScreen.routeName : (context) => const MainScreen(),
      },
      home: const MainScreen(),
    );
  }
}