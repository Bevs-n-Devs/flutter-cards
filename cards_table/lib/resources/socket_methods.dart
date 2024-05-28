import 'package:cards_table/resources/socket_client.dart';
import 'package:cards_table/screens/card_table_screen.dart';
import 'package:flutter/material.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  
  void makeTable(String nickname) {
    if (nickname.isNotEmpty) {
      print("Creating table with nickname: " +nickname);
      _socketClient.emit('createTable', {
        'nickname' : nickname,
      });
    }
  }

  void createTableSuccessListener(BuildContext context) {
    _socketClient.on('createTableSuccess', (table) {
      print(table);
      Navigator.pushNamed(context, CardTableScreen.routeName);
    });
  }
}