class AllGamesModel {
  final List<Game> games;

  AllGamesModel({required this.games});

  factory AllGamesModel.fromJson(Map<String, dynamic> json) {
    return AllGamesModel(
      games: List<Game>.from(json['games'].map((game) => Game.fromJson(game))),
    );
  }
}

class Game {
  final String id;
  final String status;
  final String wordToGuess;
  final List<Player> players;

  Game({
    required this.id,
    required this.status,
    required this.wordToGuess,
    required this.players,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      status: json['status'],
      wordToGuess: json['wordToGuess'],
      players: List<Player>.from(
        json['players'].map((player) => Player.fromJson(player)),
      ),
    );
  }
}

class Player {
  final String id;
  final String name;
  final String role;
  final bool isInsider;

  Player({
    required this.id,
    required this.name,
    required this.role,
    required this.isInsider,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      isInsider: json['isInsider'],
    );
  }
}

// Mock data
final AllGamesModel mockAllGamesData = AllGamesModel(games: [
  Game(
    id: 'game1',
    status: 'COMPLETED',
    wordToGuess: 'table',
    players: [
      Player(id: 'player1', name: 'Alice', role: 'COMMONER', isInsider: false),
      Player(id: 'player2', name: 'Bob', role: 'INSIDER', isInsider: true),
      Player(id: 'player3', name: 'Charlie', role: 'MASTER', isInsider: false),
    ],
  ),
  Game(
    id: 'game2',
    status: 'IN_PROGRESS',
    wordToGuess: 'chair',
    players: [
      Player(id: 'player1', name: 'Alice', role: 'COMMONER', isInsider: false),
      Player(id: 'player4', name: 'David', role: 'COMMONER', isInsider: false),
    ],
  ),
  Game(
    id: 'game3',
    status: 'NOT_STARTED',
    wordToGuess: 'sofa',
    players: [],
  ),
]);
