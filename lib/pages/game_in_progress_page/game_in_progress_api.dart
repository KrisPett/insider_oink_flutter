import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'game_in_progress_model.dart';

final logger = Logger();

const requestMapping = "api/insider";
var baseUrl = dotenv.env['BACKEND_API_URL'];

Future<GameInProgressModel?> fetchGameInProgressData(String gameId) async {
  final url =
      Uri.parse('$baseUrl/$requestMapping/game/$gameId/game-in-progress-page');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return GameInProgressModel.fromJson(jsonResponse);
    } else {
      logger.e('Failed to load games. Status code: ${response.statusCode}');
      return mockGameInProgressModel;
    }
  } catch (e) {
    logger.e('Error fetching games:', error: e);
    return mockGameInProgressModel;
  }
}

Future<GameInProgressModel?> fetchGuessWord(String gameId, String message) async {
  final url = Uri.parse(
      '$baseUrl/$requestMapping/game/$gameId/guess?guessWord=$message');
  try {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return GameInProgressModel.fromJson(jsonResponse);
    } else {
      logger.e('Failed to load games. Status code: ${response.statusCode}');
      return mockGameInProgressModel;
    }
  } catch (e) {
    logger.e('Error fetching games:', error: e);
    return mockGameInProgressModel;
  }
}
