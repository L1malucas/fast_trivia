import 'package:fast_trivia/src/core/exceptions/request_exceptions.dart';
import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/models/quiz_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../providers/storage_provider.dart';

class RestClient {
  static const baseUrl = '${LocalHost.ip}/questionario';

  static Future<List<QuizzModel>> getQuizz() async {
    try {
      final response = await http.get(Uri.parse(baseUrl)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw RequestExceptions(message: 'TimeOut');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        List<QuizzModel> questionarios = parseQuizzList(jsonData);

        await StorageProvider.saveQuizzToSharedPreferences(questionarios);

        return questionarios;
      } else {
        throw RequestExceptions(
          message: 'Falha na request GetAll',
        );
      }
    } catch (e) {
      throw RequestExceptions(
        message: e.toString(),
      );
    }
  }

  static List<QuizzModel> parseQuizzList(List<dynamic> jsonData) {
    List<QuizzModel> questionarios = [];

    for (var item in jsonData) {
      questionarios.add(QuizzModel.fromJson(item));
    }

    return questionarios;
  }
}
