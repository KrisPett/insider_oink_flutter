class GameInProgressModel {
  final String id;
  final Game game;
  final Chat chat;

  GameInProgressModel({
    required this.id,
    required this.game,
    required this.chat,
  });

  factory GameInProgressModel.fromJson(Map<String, dynamic> json) {
    return GameInProgressModel(
      id: json['id'],
      game: Game.fromJson(json['game']),
      chat: Chat.fromJson(json['chat']),
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

class Chat {
  final String id;
  final List<Guess> guesses;

  Chat({
    required this.id,
    required this.guesses,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      guesses: List<Guess>.from(
        json['guesses'].map((guess) => Guess.fromJson(guess)),
      ),
    );
  }
}

class Guess {
  final String id;
  final String message;
  final String playerId;
  final String role;

  Guess({
    required this.id,
    required this.message,
    required this.playerId,
    required this.role,
  });

  factory Guess.fromJson(Map<String, dynamic> json) {
    return Guess(
      id: json['id'],
      message: json['message'],
      playerId: json['playerId'],
      role: json['role'],
    );
  }
}

// Mock Data
final mockGameInProgressModel = GameInProgressModel(
  id: 'game_in_progress_1',
  game: Game(
    id: 'game_1',
    status: 'ongoing',
    wordToGuess: 'Flutter',
    players: [
      Player(
        id: 'player_1',
        name: 'Alice',
        role: 'COMMONER',
        isInsider: false,
      ),
      Player(
        id: 'player_2',
        name: 'Bob',
        role: 'COMMONER',
        isInsider: false,
      ),
      Player(
        id: 'player_3',
        name: 'Charlie',
        role: 'Insider',
        isInsider: true,
      ),
      Player(
        id: 'player_4',
        name: 'Lars',
        role: 'Insider',
        isInsider: true,
      ),
      Player(
        id: 'player_5',
        name: 'Emma',
        role: 'Insider',
        isInsider: true,
      ),
    ],
  ),
  chat: Chat(
    id: 'chat_1',
    guesses: [
      Guess(
        id: 'guess_1',
        message: 'Is it a programming language?',
        playerId: 'player_1',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_2',
        message: 'No, it is not.',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_3',
        message: 'Is it a framework?',
        playerId: 'player_1',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_4',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_5',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_6',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_7',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_8',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_9',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_10',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
      Guess(
        id: 'guess_11',
        message: 'Yes, it is!',
        playerId: 'player_2',
        role: 'COMMONER',
      ),
    ],
  ),
);
