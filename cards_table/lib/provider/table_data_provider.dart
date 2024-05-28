import 'package:flutter/material.dart';

class TableDataProvider extends ChangeNotifier {
  // notify listener
  Map<String, dynamic> _tableData = {};

  Map<String, dynamic> get tableData => _tableData;
  /**
   * Alert that data has been updated
   */
  void updateTableData(Map<String, dynamic> data) {
    _tableData = data;
    notifyListeners();
  }
}