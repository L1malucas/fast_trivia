import 'package:fast_trivia/src/core/ui/widget/alert.dart';
import 'package:flutter/material.dart';
import '../../core/ui/constants.dart';
import '../../core/ui/widget/fixed_spacer.dart';

class QuizzCardPreview extends StatelessWidget {
  const QuizzCardPreview({
    Key? key,
    required this.questionsLenght,
    required this.themeName,
    required this.themeImage,
    required this.iconData,
    this.backgroundColor,
  }) : super(key: key);

  final int questionsLenght;
  final String themeName;
  final String themeImage;
  final IconData iconData;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Alert(
          context: context,
          type: AlertType.yesNo,
          title: 'Iniciar o quizz?',
          message: 'A contagem irá iniciar automaticamente ao clicar em sim',
          onConfirmPressed: () {
            Navigator.of(context).pushReplacementNamed('/quizz/quizz_game');
          },
        ).show();
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
                    themeName,
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
                Text(
                  '$questionsLenght Questões',
                  style: const TextStyle(
                    color: ColorsContants.white,
                    fontSize: 16,
                  ),
                ),
                // mudar icone para play ou check
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
