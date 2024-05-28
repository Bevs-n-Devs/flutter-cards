import "package:cards_table/provider/table_data_provider.dart";
import "package:cards_table/screens/card_table_screen.dart";
import "package:cards_table/screens/jump_on_table.dart";
import "package:cards_table/screens/main_screen.dart";
import "package:cards_table/screens/bring_table_entry.dart";
import "package:cards_table/screens/wait_for_table_screen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (context) => TableDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cards Table App",
        routes: {
          MainScreen.routeName : (context) => const MainScreen(),
          BringTableScreen.routeName : (context) => const BringTableScreen(),
          CardTableScreen.routeName : (context) => const CardTableScreen(),
          JumpOnTableScreen.routeName : (context) => const JumpOnTableScreen(),
          WaitForTableScreen.routeName : (context) => const WaitForTableScreen()
        },
        home: const MainScreen(),
      ),
    );
  }
}