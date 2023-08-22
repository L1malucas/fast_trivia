class UserModel {
  final int idUsuario;
  final List<int> questionariosRespondidos;
  final List<int> temasRespondidos; 
  final int respostasCorretas;

  UserModel({
    required this.idUsuario,
    required this.questionariosRespondidos,
    required this.temasRespondidos,
    required this.respostasCorretas,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUsuario: json['id_usuario'],
      questionariosRespondidos:
          List<int>.from(json['questionarios_respondidos']),
      temasRespondidos:
          List<int>.from(json['temas_respondidos']), 
      respostasCorretas: json['respostas_corretas'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_usuario': idUsuario,
      'questionarios_respondidos': questionariosRespondidos,
      'temas_respondidos': temasRespondidos, 
      'respostas_corretas': respostasCorretas,
    };
  }
}
