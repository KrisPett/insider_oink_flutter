import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import 'game_in_progress_api.dart';
import 'game_in_progress_model.dart';

class GameInProgressPage extends StatefulWidget {
  const GameInProgressPage({super.key});

  @override
  GameInProgressPageState createState() => GameInProgressPageState();
}

class GameInProgressPageState extends State<GameInProgressPage> {
  GameInProgressModel? gameInProgress;
  bool isLoading = true;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String? gameId =
      ModalRoute.of(context)?.settings.arguments as String?;
      if (gameId != null) {
        loadGamesData(gameId);
      }
    });
  }

  void handleGuessWord(String guess) {
    fetchGuessWord(gameInProgress!.game.id, guess).then((res) {
      setState(() {
        gameInProgress = res;
        _scrollToBottom();
        _textEditingController.clear();
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit guess: $error')),
      );
    });
  }

  void loadGamesData(String gameId) {
    fetchGameInProgressData(gameId).then((res) {
      setState(() {
        gameInProgress = res;
        isLoading = false;
      });
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (gameInProgress == null) {
      return const Scaffold(
        appBar: CustomAppBar(title: "Game in progress"),
        body: Center(child: Text("Failed to load game data.")),
        bottomNavigationBar: CustomBottomNavBar(),
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Game in progress"),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    gameInProgress!.game.id,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Correct word = ${gameInProgress!.game.wordToGuess}',
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.5),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                children: gameInProgress!.game.players
                    .map((player) => _buildPlayerCircle(player))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: gameInProgress?.chat.guesses.length,
              itemBuilder: (context, index) {
                return _buildMessageRow(gameInProgress!.chat.guesses[index]);
              },
            ),
          ),
          const Divider(thickness: 1.5),
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,  // Attach the TextEditingController here
              decoration: InputDecoration(
                hintText: 'Type your guess here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  handleGuessWord(value);
                }
              },
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
            child: Text(
              guess.role.isNotEmpty ? guess.role[0] : '?',
              style: const TextStyle(fontSize: 12),
            ),
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
