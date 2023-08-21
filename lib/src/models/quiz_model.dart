class QuizzModel {
  final int idTema;
  final String tema;
  final List<QuestionModel> questoes;

  QuizzModel({
    required this.idTema,
    required this.tema,
    required this.questoes,
  });

  factory QuizzModel.fromJson(Map<String, dynamic> json) {
    List<QuestionModel> questions = (json['questoes'] as List)
        .map((questionJson) => QuestionModel.fromJson(questionJson))
        .toList();

    return QuizzModel(
      idTema: json['id_tema'],
      tema: json['tema'],
      questoes: questions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_tema': idTema,
      'tema': tema,
      'questoes': questoes.map((question) => question.toJson()).toList(),
    };
  }
}

class QuestionModel {
  final int questaoId;
  final String pergunta;
  final int resposta;
  final List<String> alternativas;

  QuestionModel({
    required this.questaoId,
    required this.pergunta,
    required this.resposta,
    required this.alternativas,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questaoId: json['questao_id'],
      pergunta: json['pergunta'],
      resposta: json['resposta'],
      alternativas: List<String>.from(json['alternativas']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questao_id': questaoId,
      'pergunta': pergunta,
      'resposta': resposta,
      'alternativas': alternativas,
    };
  }
}
