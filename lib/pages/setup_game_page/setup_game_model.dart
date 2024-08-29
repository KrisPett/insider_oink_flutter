class SetupGameModel {
  String id;
  final List<Player> players;

  SetupGameModel({required this.id, required this.players});

  factory SetupGameModel.fromJson(Map<String, dynamic> json) {
    return SetupGameModel(
      id: json['id'],
      players: List<Player>.from(
          json['players'].map((item) => Player.fromJson(item))),
    );
  }
}

class Player {
  final String id;
  final String name;

  Player({
    required this.id,
    required this.name,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
    );
  }
}

// Mock data
final SetupGameModel mockSetupGame = SetupGameModel(
  id: 'game1',
  players: [
    Player(id: 'player1', name: 'Alice'),
    Player(id: 'player2', name: 'Bob'),
    Player(id: 'player3', name: 'Charlie'),
    Player(id: 'player4', name: 'David'),
  ],
);
