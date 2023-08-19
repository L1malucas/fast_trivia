class Questionario {
  final List<Tema> temas;

  Questionario({required this.temas});

  factory Questionario.fromJson(Map<String, dynamic> json) {
    final temasList = json['questionario'] as List<dynamic>;
    final temas = temasList.map((temaJson) => Tema.fromJson(temaJson)).toList();

    return Questionario(temas: temas);
  }
}

class Tema {
  final int idTema;
  final String tema;
  final List<Questao> questoes;

  Tema({required this.idTema, required this.tema, required this.questoes});

  factory Tema.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id_tema': final int idTema,
        'tema': final String tema,
        'questoes': final List<Questao> questoes
      } =>
        Tema(idTema: idTema, tema: tema, questoes: questoes),
      _ => throw ArgumentError('Json inválido')
    };
  }
}

class Questao {
  final int questaoId;
  final String pergunta;
  final int resposta;
  final List<String> alternativas;

  Questao({
    required this.questaoId,
    required this.pergunta,
    required this.resposta,
    required this.alternativas,
  });

  factory Questao.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'questao+id': final int questaoId,
        'pergunta': final String pergunta,
        'resposta': final int resposta,
      } =>
        Questao(
            questaoId: questaoId,
            pergunta: pergunta,
            resposta: resposta,
            alternativas: json['alternativas'].cast<String>()),
      _ => throw ArgumentError('Json inválido')
    };
  }
}
