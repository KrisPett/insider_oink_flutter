import 'package:flutter/material.dart';
import 'package:insider_oink_flutter/pages/setup_game_page/setup_game_api.dart';
import 'package:insider_oink_flutter/pages/setup_game_page/setup_game_model.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class SetupGamePage extends StatefulWidget {
  const SetupGamePage({super.key});

  @override
  SetupGamePageState createState() => SetupGamePageState();
}

class SetupGamePageState extends State<SetupGamePage> {
  SetupGameModel? setupGameModel;
  bool isLoading = true;

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

  void loadGamesData(String gameId) {
    fetchSetupGamePage(gameId).then((res) {
      setState(() {
        setupGameModel = res;
        isLoading = false;
      });
    });
  }

  void onClickAddPlayer(String gameId, String playerName) {
    fetchAddPlayerToGame(gameId, playerName).then((res) {
      setState(() {
        setupGameModel = res;
      });
    });
  }

  void onClickStartGame() {
    fetchStartGame(setupGameModel!.id).then((res) {
      if (mounted) {
        Navigator.pushNamed(
          context,
          '/game-in-progress',
          arguments: setupGameModel?.id,
        );
      }
    }).catchError((error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to start the game: $error')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Setup Game"),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Game ID: ${setupGameModel?.id ?? 'Unknown'}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      onClickAddPlayer(setupGameModel!.id, "test3");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Player',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      onClickStartGame();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Center(
                      child: Text(
                        'Start Game',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Players',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: setupGameModel?.players.length ?? 0,
                      itemBuilder: (context, index) {
                        final player = setupGameModel?.players[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          height: 50,
                          color: Colors.grey[300],
                          child: Center(
                            child: Text(player?.name ?? 'Unknown Player'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
