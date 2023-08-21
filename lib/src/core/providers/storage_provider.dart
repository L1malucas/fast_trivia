import 'package:fast_trivia/src/models/quiz_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider {
  static Future<void> saveQuizzToSharedPreferences(
      List<Questionario> questionarios) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = questionarios.map((q) => q.toJson()).toList();
    await prefs.setString('questionarios', jsonEncode(jsonData));
  }

  static Future<List<Questionario>> getQuizzFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('questionarios');
    if (jsonData != null) {
      final List<dynamic> decodedData = jsonDecode(jsonData);
      final List<Questionario> questionarios =
          decodedData.map((json) => Questionario.fromJson(json)).toList();
      return questionarios;
    } else {
      return [];
    }
  }
}
