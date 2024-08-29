import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import 'all_games_api.dart';
import 'all_games_modal.dart';

class AllGamesPage extends StatefulWidget {
  const AllGamesPage({super.key});

  @override
  AllGamesPageState createState() => AllGamesPageState();
}

class AllGamesPageState extends State<AllGamesPage> {
  AllGamesModel? allGamesData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadGamesData();
  }

  void loadGamesData() {
    fetchGamesData().then((res) {
      setState(() {
        allGamesData = res;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : allGamesData != null && allGamesData!.games.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Games',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: allGamesData!.games.length,
                          itemBuilder: (context, index) {
                            return _buildGameItem(allGamesData!.games[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text(
                    'No games available.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  Widget _buildGameItem(Game game) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text(
          game.id,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Status: ${game.status}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          print('Tapped on ${game.id}');
        },
      ),
    );
  }
}
