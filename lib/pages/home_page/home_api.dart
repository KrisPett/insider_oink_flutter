import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

final logger = Logger();

const requestMapping = "api/insider";
var baseUrl = dotenv.env['BACKEND_API_URL'];

Future<String?> fetchCreateGame(String wordToGuess) async {
  final url = Uri.parse(
      '$baseUrl/$requestMapping/game/create?wordToGuess=$wordToGuess');
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
