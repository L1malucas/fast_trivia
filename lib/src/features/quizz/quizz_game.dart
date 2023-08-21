import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/core/ui/helpers/messages_helpers.dart';
import 'package:fast_trivia/src/core/ui/widget/alert.dart';
import 'package:fast_trivia/src/core/ui/widget/fixed_spacer.dart';
import 'package:fast_trivia/src/features/quizz/quizz_text.dart';
import 'package:flutter/material.dart';

class QuizzGame extends StatefulWidget {
  const QuizzGame({super.key});

  @override
  State<QuizzGame> createState() => _QuizzGameState();
}

class _QuizzGameState extends State<QuizzGame> {
  bool selected = false;

  Future<bool> _onWillPop() async {
    _showExitAlert(context);
    return false;
  }

  void _showExitAlert(BuildContext context) {
    Alert(
            onConfirmPressed: () {
              Navigator.pop(context);
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
                    width: 38,
                    height: 38,
                    textStyle: const TextStyle(
                        color: ColorsContants.white, fontSize: 18),
                    duration: 7,
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
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImageConstants.salvadorTheme,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // contagem das questões
              FixedSpacer.vSmall,
              const QuizzText(
                text: "questão x de y",
                size: 20,
                textAlign: TextAlign.start,
              ),
              // título da questão
              FixedSpacer.vSmall,
              QuizzText(
                  fontWeight: FontWeight.w600,
                  text:
                      "Qual o nome da maior floresta brasileira?".toUpperCase(),
                  size: 28),
              // alternativas
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      // tudo branco, vira verde quando clickado
                      color:
                          selected ? ColorsContants.blue : ColorsContants.white,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            print(selected);
                          });
                        },
                        child: Text(
                          "Qual o nome da maior floresta brasileira?",
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
