import 'package:cards_table/provider/table_data_provider.dart';
import 'package:cards_table/resources/socket_methods.dart';
import 'package:cards_table/utils/colors.dart';
import 'package:cards_table/views/waiting_lobby.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTableScreen extends StatefulWidget {
  static String routeName = '/card-table';
  const CardTableScreen({super.key});

  @override
  State<CardTableScreen> createState() => _CardTableScreenState();
}

class _CardTableScreenState extends State<CardTableScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateTableListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<TableDataProvider>(context).player1.nickname);
    // print(Provider.of<TableDataProvider>(context).player2.nickname);
    // print(Provider.of<TableDataProvider>(context).player3.nickname);
    // print(Provider.of<TableDataProvider>(context).player4.nickname);
    // Provider.of<TableDataProvider>(context).tableData['players'].toString();
    TableDataProvider tableDataProvider = Provider.of<TableDataProvider>(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: tableDataProvider.tableData['isJoin'] 
      ? const WaitingLobby() 
      : Center(
        child: Text(
          Provider.of<TableDataProvider>(context).tableData.toString(),
          style: const TextStyle(
            color: txtColor1,
          ),
        )
      )
    );
  }
}