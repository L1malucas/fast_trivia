import 'package:fast_trivia/src/core/providers/storage_provider.dart';
import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/widget/fixed_spacer.dart';
import '../../models/quiz_model.dart';
import '../../models/user_model.dart';
import 'quizz_text.dart';

class QuizzFeedback extends StatefulWidget {
  const QuizzFeedback({
    super.key,
    this.quizzModel,
  });

  final QuizzModel? quizzModel;

  @override
  State<QuizzFeedback> createState() => _QuizzFeedbackState();
}

class _QuizzFeedbackState extends State<QuizzFeedback> {
  int questionActive = 0;
  late int answer;
  late int alternativesLength;
  int questionsLength = -1;
  late String question;
  UserModel? userResponses;

  @override
  void initState() {
    initializeData();
    getUserResponses();
    super.initState();
  }

  void initializeData() {
    questionActive = widget.quizzModel!.questoes[0].questaoId;
    answer = widget.quizzModel!.questoes[questionActive].resposta;
    questionsLength = widget.quizzModel!.questoes.length;
    alternativesLength =
        widget.quizzModel!.questoes[questionActive].alternativas.length;
    question = widget.quizzModel!.questoes[0].pergunta;
  }

  void getUserResponses() async {
    userResponses =
        await StorageProvider.getUserResponsesFromSharedPreferences();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      question = widget.quizzModel!.questoes[questionActive].pergunta;
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.of(context).pushReplacementNamed(
              '/home/user_history',
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Gabarito do quizz',
                style: TextStyle(
                  color: ColorsContants.red,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            FixedSpacer.vNormal,
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Na cor verde a resposta correta, na cor vermelha a sua resposta',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: ColorsContants.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FixedSpacer.vNormal,
            SizedBox(
              width: double.infinity,
              child: Text(
                '$questionsLength respostas corretas',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsContants.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FixedSpacer.vNormal,
            QuizzText(
                color: ColorsContants.black,
                fontWeight: FontWeight.w700,
                text: question.toUpperCase(),
                size: 26),
            FixedSpacer.vNormal,
            Expanded(
              child: ListView.builder(
                itemCount: alternativesLength,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    color: index == answer
                        ? ColorsContants.green
                        : ColorsContants.blue,
                    child: Text(
                      widget.quizzModel!.questoes[questionActive]
                          .alternativas[index],
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: index == answer
                            ? ColorsContants.brown
                            : ColorsContants.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 4,
                color: ColorsContants.red,
                child: Text(
                  userResponses != null
                      ? widget.quizzModel!.questoes[questionActive]
                              .alternativas[
                          userResponses!.respostasDoUsuario[questionActive]]
                      : '',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorsContants.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            FixedSpacer.vBiggest,
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 36,
                width: 92,
                child: Card(
                  color: ColorsContants.blue,
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (questionActive < questionsLength - 1) {
                          questionActive += 1;
                        } else {
                          Navigator.of(context).pushNamed(
                            '/home/user_history',
                          );
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        questionActive == questionsLength - 1
                            ? 'Finalizar'
                            : "Avançar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: ColorsContants.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FixedSpacer.vBig,
          ],
        ),
      ),
    );
  }
}
