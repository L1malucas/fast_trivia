import '../../models/quiz_model.dart';

class QuestionarioSingleton {
  static final QuestionarioSingleton _instance =
      QuestionarioSingleton._internal();

  factory QuestionarioSingleton() {
    return _instance;
  }

  QuestionarioSingleton._internal();

  List<Questionario> questionarios = [];
}

final questionarioSingleton = QuestionarioSingleton();
