
import 'package:cards_table/provider/table_data_provider.dart';
import 'package:cards_table/utils/colors.dart';
import 'package:cards_table/widgets/custom_text.dart';
import 'package:cards_table/widgets/custom_text_fld.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController tableIdController;

  @override
  void initState() {
    super.initState();
    tableIdController = TextEditingController(
      text: Provider.of<TableDataProvider>(context, listen: false).tableData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    tableIdController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Waiting for more players...', style: TextStyle(color: txtColor1),),
        const SizedBox(height: 20),
        CustomTextFld(
          controller: tableIdController, 
          hintText: '', 
          isReadOnly: true,
        )
      ],
    );
  }
}