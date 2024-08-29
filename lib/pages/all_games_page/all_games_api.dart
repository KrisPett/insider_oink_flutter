import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'all_games_model.dart';

final logger = Logger();

const requestMapping = "api/insider";
var baseUrl = dotenv.env['BACKEND_API_URL'];

Future<AllGamesModel?> fetchGamesData() async {
  final url = Uri.parse('$baseUrl/$requestMapping/game');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return AllGamesModel.fromJson(jsonResponse);
    } else {
      logger.e('Failed to load games. Status code: ${response.statusCode}');
      return mockAllGamesData;
    }
  } catch (e) {
    logger.e('Error fetching games:', error: e);
    return mockAllGamesData;
  }
}
