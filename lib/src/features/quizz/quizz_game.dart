import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/core/ui/widget/messages_helpers.dart';
import 'package:fast_trivia/src/core/ui/widget/alert.dart';
import 'package:fast_trivia/src/core/ui/widget/fixed_spacer.dart';
import 'package:fast_trivia/src/features/home/home_page.dart';
import 'package:fast_trivia/src/features/quizz/quizz_text.dart';
import 'package:flutter/material.dart';

import '../../models/quiz_model.dart';

// ignore: must_be_immutable
class QuizzGame extends StatefulWidget {
  QuizzGame({
    super.key,
    this.themeImage,
    this.quizzModel,
  });

  String? themeImage;
  QuizzModel? quizzModel;

  @override
  State<QuizzGame> createState() => _QuizzGameState();
}

class _QuizzGameState extends State<QuizzGame> {
  bool selected = false;
  int questionActive = 0;
  late int answer;
  late int alternativesLength;
  int questionsLength = -1;
  late String question;

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  void initializeData() {
    questionActive = widget.quizzModel!.questoes[0].questaoId;
    answer = widget.quizzModel!.questoes[questionActive].resposta;
    questionsLength = widget.quizzModel!.questoes.length;
    alternativesLength =
        widget.quizzModel!.questoes[questionActive].alternativas.length;
    question = widget.quizzModel!.questoes[questionActive].pergunta;
    print(questionActive);
  }

  Future<bool> _onWillPop() async {
    _showExitAlert(context);
    return false;
  }

  void _showExitAlert(BuildContext context) {
    Alert(
            onConfirmPressed: () async {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
              return false;
            },
            onCancelPressed: () {},
            title: 'Sair do quizz',
            context: context,
            type: AlertType.yesNo,
            message:
                'Ao sair todos dados serão perdidos \n Tem certeza que deseja sair?')
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: ColorsContants.quizzBackground,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 32.0, 10.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FixedSpacer.vNormal,
              // countdown e saída do quizz
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      _showExitAlert(context);
                    },
                    icon: const Icon(
                      size: 38,
                      Icons.close_rounded,
                      color: ColorsContants.white,
                    ),
                  ),
                  CircularCountDownTimer(
                    isReverse: true,
                    width: 38,
                    height: 38,
                    textStyle: const TextStyle(
                        color: ColorsContants.white, fontSize: 18),
                    duration: 8,
                    fillColor: ColorsContants.red,
                    ringColor: ColorsContants.white,
                    onComplete: () {
                      MessagesHelper.showError('Tempo Esgotado', context);
                    },
                  )
                ],
              ),
              // imagem do tema
              FixedSpacer.vSmall,
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          widget.themeImage!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // contagem das questões
              FixedSpacer.vSmall,
              QuizzText(
                text: "questão $questionActive de $questionsLength",
                size: 20,
                textAlign: TextAlign.start,
              ),
              // título da questão
              FixedSpacer.vSmall,
              QuizzText(
                  fontWeight: FontWeight.w600,
                  text: question.toUpperCase(),
                  size: 28),
              // alternativas
              Expanded(
                child: ListView.builder(
                  itemCount: alternativesLength,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Card(
                        elevation: 4,
                        // tudo branco, vira verde quando clickado
                        color: selected
                            ? ColorsContants.blue
                            : ColorsContants.white,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selected = !selected;
                              print(selected);
                              Navigator.of(context)
                                  .pushNamed('/quizz/quizz_finish');
                            });
                          },
                          child: Text(
                            widget.quizzModel!.questoes[questionActive]
                                .alternativas[index],
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selected
                                  ? ColorsContants.white
                                  : ColorsContants.brown,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
