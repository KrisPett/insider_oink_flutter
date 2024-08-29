import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:insider_oink_flutter/pages/setup_game_page/setup_game_model.dart';
import 'package:logger/logger.dart';

final logger = Logger();

const requestMapping = "api/insider";
var baseUrl = dotenv.env['BACKEND_API_URL'];

Future<SetupGameModel?> fetchSetupGamePage(String gameId) async {
  final url =
      Uri.parse('$baseUrl/$requestMapping/game/$gameId/setup-game-page');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return SetupGameModel.fromJson(jsonResponse);
    } else {
      logger.e('Failed to load games. Status code: ${response.statusCode}');
      return mockSetupGame;
    }
  } catch (e) {
    logger.e('Error fetching games:', error: e);
    return mockSetupGame;
  }
}

Future<SetupGameModel?> fetchAddPlayerToGame(
    String gameId, String playerName) async {
  final url = Uri.parse(
      '$baseUrl/$requestMapping/game/$gameId/join?playerName=$playerName');
  try {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return SetupGameModel.fromJson(jsonResponse);
    } else {
      logger.e('Failed to load games. Status code: ${response.statusCode}');
      return mockSetupGame;
    }
  } catch (e) {
    logger.e('Error fetching games:', error: e);
    return mockSetupGame;
  }
}

Future<String?> fetchStartGame(String gameId) async {
  final url = Uri.parse(
      '$baseUrl/$requestMapping/game/$gameId/start');
  try {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final gameId = response.body;
      return gameId;
    } else {
      logger.e('Failed to create game. Status code: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    logger.e('Error creating game:', error: e);
    return null;
  }
}

Future<SetupGameModel?> fetchCreatePlayerToGame(
    String gameId, String playerName) async {
  final url = Uri.parse(
      '$baseUrl/$requestMapping/game/$gameId/join?playerName=$playerName');
  try {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return SetupGameModel.fromJson(jsonResponse);
    } else {
      logger.e('Failed to load games. Status code: ${response.statusCode}');
      return mockSetupGame;
    }
  } catch (e) {
    logger.e('Error fetching games:', error: e);
    return mockSetupGame;
  }
}