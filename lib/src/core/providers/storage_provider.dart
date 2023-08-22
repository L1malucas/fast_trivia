import 'package:fast_trivia/src/models/quiz_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider {
  static Future<void> saveQuizzToSharedPreferences(
      List<QuizzModel> questionarios) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = questionarios.map((q) => q.toJson()).toList();
    await prefs.setString('questionarios', jsonEncode(jsonData));
  }

  static Future<List<QuizzModel>> getQuizzFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('questionarios');
    if (jsonData != null) {
      final List<dynamic> decodedData = jsonDecode(jsonData);
      final List<QuizzModel> questionarios =
          decodedData.map((json) => QuizzModel.fromJson(json)).toList();
      return questionarios;
    } else {
      return [];
    }
  }

  static Future<void> clearQuizzDataFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('questionarios');
  }
}
