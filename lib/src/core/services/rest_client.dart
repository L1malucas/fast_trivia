import 'package:fast_trivia/src/core/exceptions/request_exceptions.dart';
import 'package:fast_trivia/src/core/providers/storage_provider.dart';
import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/models/quiz_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestClient {
  static const baseUrl = '${LocalHost.ip}/questionario';

  static Future<List<Questionario>> getQuizz() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<Questionario> questionarios =
            jsonData.map((json) => Questionario.fromJson(json)).toList();
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
}
