import 'package:cards_table/resources/socket_client.dart';

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
}