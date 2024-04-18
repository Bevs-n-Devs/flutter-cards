import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/widgets.dart";


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cards Table App",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Testing", style: TextStyle(fontWeight: FontWeight.bold))),
          backgroundColor: Colors.purpleAccent,
          shadowColor: Colors.redAccent,
        ),
        backgroundColor: const Color.fromARGB(255, 33, 26, 36),
        body: const Center(
          child: TextButton(
            onPressed: null, 
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber),
            ),
            child: Text(
              "Text Button", 
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)),
        ),
      ),
    );
  }

  void handleBtnPress(){
    log("Clicked");
  }
  
}