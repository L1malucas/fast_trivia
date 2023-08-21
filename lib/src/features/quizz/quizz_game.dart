import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/core/ui/helpers/messages_helpers.dart';
import 'package:fast_trivia/src/core/ui/widget/alert.dart';
import 'package:fast_trivia/src/core/ui/widget/fixed_spacer.dart';
import 'package:flutter/material.dart';

class QuizzGame extends StatefulWidget {
  const QuizzGame({super.key});

  @override
  State<QuizzGame> createState() => _QuizzGameState();
}

class _QuizzGameState extends State<QuizzGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Alert(
                            onConfirmPressed: () {
                              Navigator.pop(context);
                            },
                            onCancelPressed: () {
                              Navigator.pop(context);
                            },
                            title: 'Sair do quizz',
                            context: context,
                            type: AlertType.yesNo,
                            message:
                                'Ao sair todos dados serão perdidos \n Tem certeza que deseja sair?')
                        .show();
                  },
                  icon: const Icon(
                    size: 38,
                    Icons.close_rounded,
                    color: ColorsContants.white,
                  ),
                ),
                CircularCountDownTimer(
                  autoStart: false,
                  width: 38,
                  height: 38,
                  textStyle: const TextStyle(
                      color: ColorsContants.white, fontSize: 18),
                  duration: 5,
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
                borderRadius:
                    BorderRadius.circular(12.0), // Adjust the radius as needed
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
            const SizedBox(
              width: double.infinity,
              child: Text(
                maxLines: 3,
                "Questão x de y",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: ColorsContants.white,
                  fontSize: 20,
                ),
              ),
            ),
            // título da questão
            FixedSpacer.vSmall,
            SizedBox(
              width: double.infinity,
              child: Text(
                maxLines: 3,
                "Qual o nome da maior floresta brasileira?".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsContants.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // alternativas
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    color: ColorsContants.blue,
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        maxLines: 3,
                        "Qual o nome da maior floresta brasileira?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsContants.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
