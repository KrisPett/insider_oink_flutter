import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:insider_oink_flutter/pages/SetupGame.dart';
import 'package:insider_oink_flutter/pages/all_games_page/all_games_page.dart';
import 'package:insider_oink_flutter/pages/home_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/all-games': (context) => const AllGamesPage(),
        '/setup-game': (context) => const SetupGamePage(),
        '/game-in-progress': (context) => const AllGamesPage(),
      },
    );
  }
}
