import 'package:fast_trivia/src/core/ui/widget/alert.dart';
import 'package:fast_trivia/src/features/quizz/quizz_feedback.dart';
import 'package:fast_trivia/src/features/quizz/quizz_game.dart';
import 'package:fast_trivia/src/models/quiz_model.dart';
import 'package:flutter/material.dart';
import '../../core/ui/constants.dart';
import '../../core/ui/widget/fixed_spacer.dart';

class QuizzCardPreview extends StatelessWidget {
  const QuizzCardPreview({
    Key? key,
    required this.themeImage,
    required this.iconData,
    required this.quizzModel,
    this.rightAnswers,
    this.backgroundColor,
  }) : super(key: key);

  final QuizzModel quizzModel;
  final String themeImage;
  final IconData iconData;
  final Color? backgroundColor;
  final int? rightAnswers;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (rightAnswers != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => QuizzFeedback(
                quizzModel: quizzModel,
              ),
            ),
          );
        } else {
          Alert(
            context: context,
            type: AlertType.yesNo,
            title: 'Iniciar o quizz?',
            message: 'A contagem irá iniciar automaticamente ao clicar em sim',
            onConfirmPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizzGame(
                    themeImage: themeImage,
                    quizzModel: quizzModel,
                  ),
                ),
              );
            },
          ).show();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(24.0),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  height: 64,
                  child: Text(
                    quizzModel.tema,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ColorsContants.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                FixedSpacer.vSmaller,
                Row(
                  children: [
                    Text(
                      '${quizzModel.questoes.length} Questões',
                      style: const TextStyle(
                        color: ColorsContants.white,
                        fontSize: 16,
                      ),
                    ),
                    Visibility(
                      visible: rightAnswers != null,
                      child: Text(
                        ' / ${quizzModel.questoes.length} Acertos',
                        style: const TextStyle(
                          color: ColorsContants.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                FixedSpacer.vSmaller,
                Icon(
                  size: 15,
                  iconData,
                  color: ColorsContants.white,
                ),
              ],
            ),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0 - 2.0),
                child: Image.asset(
                  themeImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
