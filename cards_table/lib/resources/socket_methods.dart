import 'package:cards_table/provider/table_data_provider.dart';
import 'package:cards_table/resources/socket_client.dart';
import 'package:cards_table/screens/card_table_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cards_table/utils/utils.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  
  // Emits
  void makeTable(String nickname) {
    if (nickname.isNotEmpty) {
      print("Creating table with nickname: " +nickname);
      _socketClient.emit('createTable', {
        'nickname' : nickname,
      });
    }
  }

  void jumpOnTable (String nickname, String tableId) {
    if (nickname.isNotEmpty && tableId.isNotEmpty) {
      print("Creating table with nickname: " +nickname + ", with table ID: " + tableId);
      _socketClient.emit('jumpOnTable', {
        'nickname': nickname,
        'tableId': tableId
      });
    }
  }
  // Listeners
  void createTableSuccessListener(BuildContext context) {
    _socketClient.on('createTableSuccess', (table) {
      print(table);
      Provider.of<TableDataProvider>(context, listen: false)
        .updateTableData(table);
      Navigator.pushNamed(context, CardTableScreen.routeName);
    });
  }
  void joinTableSuccessListener(BuildContext context) {
    _socketClient.on('joinTableSuccess', (table) {
      print(table);
      Provider.of<TableDataProvider>(context, listen: false)
        .updateTableData(table);
      Navigator.pushNamed(context, CardTableScreen.routeName);
    });
  }
  void errorOccurredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) => {
      showSnackBar(context, data)
    });
  }

  void updatePlayerStateListener(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      Provider.of<TableDataProvider>(context, listen: false).updatePlayer1(
        playerData[0]
      );
      Provider.of<TableDataProvider>(context, listen: false).updatePlayer2(
        playerData[1]
      );
      Provider.of<TableDataProvider>(context, listen: false).updatePlayer3(
        playerData[2]
      );
      Provider.of<TableDataProvider>(context, listen: false).updatePlayer4(
        playerData[3]
      );
    });
  }

  void updateTableListener(BuildContext context) {
    _socketClient.on('updateTable', (data) {
      Provider.of<TableDataProvider>(context, listen: false)
      .updateTableData(data);
    });
  }
}