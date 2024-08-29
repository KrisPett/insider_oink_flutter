import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class GameInProgressPage extends StatefulWidget {
  const GameInProgressPage({super.key});

  @override
  GameInProgressPageState createState() => GameInProgressPageState();
}

class GameInProgressPageState extends State<GameInProgressPage> {
  String gameId = 'Game1';
  String correctWord = 'table';

  // Mocked list of players
  List<Player> players = [
    Player(name: 'Player1', role: 'Master', isInsider: false),
    Player(name: 'Player2', role: 'Insider', isInsider: true),
    Player(name: 'Player3', role: 'COMMONER', isInsider: false),
    Player(name: 'Player4', role: 'COMMONER', isInsider: false),
    Player(name: 'Player5', role: 'COMMONER', isInsider: false),
    Player(name: 'Player6', role: 'COMMONER', isInsider: false),
  ];

  // Mocked chat messages
  List<ChatMessage> chatMessages = [
    ChatMessage(sender: 'C', message: 'Is it apple'),
    ChatMessage(sender: 'M', message: 'No'),
    ChatMessage(sender: 'C', message: 'Is it a fruit'),
    ChatMessage(sender: 'M', message: 'No'),
    ChatMessage(sender: 'C', message: 'Is it table'),
    ChatMessage(sender: 'M', message: 'Correct, you guessed the right word'),
    ChatMessage(sender: 'M', message: 'Vote insider'),
    ChatMessage(sender: 'C', message: 'Is it player2'),
    ChatMessage(sender: 'G', message: 'Yes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Game in progress"),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(gameId,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Correct word = $correctWord',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const Divider(thickness: 1.5),

          // Players Grid
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                children: players
                    .map((player) => _buildPlayerCircle(player))
                    .toList(),
              ),
            ),
          ),
          const Divider(thickness: 1.5),

          // Messages list
          Expanded(
            flex: 3,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return _buildMessageRow(chatMessages[index]);
              },
            ),
          ),

          // Bottom input area
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(16.0),
            child: const Text('Is it table', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  Widget _buildPlayerCircle(Player player) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
            border: Border.all(
                color: player.isInsider ? Colors.green : Colors.black,
                width: 2),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Text(player.name, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 4),
        Text(player.role, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildMessageRow(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Text(message.sender, style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message.message, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class Player {
  final String name;
  final String role;
  final bool isInsider;

  Player({
    required this.name,
    required this.role,
    required this.isInsider,
  });
}

class ChatMessage {
  final String sender;
  final String message;

  ChatMessage({
    required this.sender,
    required this.message,
  });
}
