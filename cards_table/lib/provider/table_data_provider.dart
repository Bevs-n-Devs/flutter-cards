import 'package:cards_table/models/player.dart';
import 'package:flutter/material.dart';

class TableDataProvider extends ChangeNotifier {
  // notify listener
  Map<String, dynamic> _tableData = {};
  Player _player1 = Player(
    nickname: '', 
    socketID: '', 
    points: 0, 
    playerSeat: 0
  );
  Player _player2 = Player(
    nickname: '', 
    socketID: '', 
    points: 0, 
    playerSeat: 1
  );
  Player _player3 = Player(
    nickname: '', 
    socketID: '', 
    points: 0, 
    playerSeat: 2
  );
  Player _player4 = Player(
    nickname: '', 
    socketID: '', 
    points: 0, 
    playerSeat: 3
  );

  Map<String, dynamic> get tableData => _tableData;
  Player get player1 => _player1;
  Player get player2 => _player2;
  Player get player3 => _player3;
  Player get player4 => _player4;

  /**
   * Alert that data has been updated
   */
  void updateTableData(Map<String, dynamic> data) {
    _tableData = data;
    notifyListeners();
  }

  void updatePlayer1 (Map<String, dynamic> player1Data){
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2 (Map<String, dynamic> player2Data){
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  void updatePlayer3 (Map<String, dynamic> player3Data){
    _player3 = Player.fromMap(player3Data);
    notifyListeners();
  }

  void updatePlayer4 (Map<String, dynamic> player4Data){
    _player4 = Player.fromMap(player4Data);
    notifyListeners();
  }
}