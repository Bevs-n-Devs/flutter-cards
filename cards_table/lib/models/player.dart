class Player {
  final String nickname;
  final String socketID;
  final double points;
  final int playerSeat; 
  
  Player({
    required this.nickname,
    required this.socketID,
    required this.points,
    required this.playerSeat
  });

  Map<String, dynamic> toMap() {
    return {
      'nickname' : nickname,
      'socketID' : socketID,
      'points' : points,
      'playerSeat' : playerSeat
    };
  }

  Player copyWith({
    String? nickname, 
    String? socketID, 
    double? points, 
    int? playerSeat
  }) {
      return Player(
        nickname : nickname ?? this.nickname,
        socketID : socketID ?? this.socketID,
        points : points ?? this.points,
        playerSeat : playerSeat ?? this.playerSeat,
      );
  }  

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.00,
      playerSeat: map['playerSeat'] ?? 0,
    );
  }
}