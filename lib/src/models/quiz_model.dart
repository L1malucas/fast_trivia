class Questionario {
  final List<Tema> temas;

  Questionario({required this.temas});

  factory Questionario.fromJson(Map<String, dynamic> json) {
    final temasList = json['questionario'] as List<dynamic>;
    final temas = temasList.map((temaJson) => Tema.fromJson(temaJson)).toList();

    return Questionario(temas: temas);
  }

  Map<String, dynamic> toJson() {
    return {
      'questionario': temas.map((tema) => tema.toJson()).toList(),
    };
  }
}

class Tema {
  final int idTema;
  final String tema;
  final List<Questao> questoes;

  Tema({required this.idTema, required this.tema, required this.questoes});

  factory Tema.fromJson(Map<String, dynamic> json) {
    return Tema(
      idTema: json['id_tema'],
      tema: json['tema'],
      questoes: (json['questoes'] as List<dynamic>)
          .map((questaoJson) => Questao.fromJson(questaoJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_tema': idTema,
      'tema': tema,
      'questoes': questoes.map((questao) => questao.toJson()).toList(),
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
    return Questao(
      questaoId: json['questao_id'],
      pergunta: json['pergunta'],
      resposta: json['resposta'],
      alternativas: (json['alternativas'] as List<dynamic>).cast<String>(),
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
