import 'package:flutter/material.dart';
import 'game_in_progress_model.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class GameInProgressPage extends StatefulWidget {
  const GameInProgressPage({super.key});

  @override
  GameInProgressPageState createState() => GameInProgressPageState();
}

class GameInProgressPageState extends State<GameInProgressPage> {
  final GameInProgressModel gameInProgress = mockGameInProgressModel;

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
                Text(gameInProgress.game.id,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Correct word = ${gameInProgress.game.wordToGuess}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const Divider(thickness: 1.5),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                children: gameInProgress.game.players
                    .map((player) => _buildPlayerCircle(player))
                    .toList(),
              ),
            ),
          ),
          const Divider(thickness: 1.5),

          Expanded(
            flex: 3,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: gameInProgress.chat.guesses.length,
              itemBuilder: (context, index) {
                return _buildMessageRow(gameInProgress.chat.guesses[index]);
              },
            ),
          ),

          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Is it ${gameInProgress.game.wordToGuess}',
              style: const TextStyle(fontSize: 16),
            ),
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

  Widget _buildMessageRow(Guess guess) {
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
            child: Text(guess.role[0], style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(guess.message, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}