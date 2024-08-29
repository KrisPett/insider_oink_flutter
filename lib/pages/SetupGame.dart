import 'package:flutter/material.dart';

class SetupGamePage extends StatelessWidget {
  const SetupGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup game'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Game1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'add Player',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'Start game',
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
                itemCount: 4, // Adjust the number of players
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 50,
                    color: Colors.grey[300],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                // Navigate to Home
              },
              child: const Text('Home'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to All Games
              },
              child: const Text('All Games'),
            ),
          ],
        ),
      ),
    );
  }
}