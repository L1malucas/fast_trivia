import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/widget/fixed_spacer.dart';
import 'quizz_text.dart';

class QuizzFeedback extends StatefulWidget {
  const QuizzFeedback({super.key});

  @override
  State<QuizzFeedback> createState() => _QuizzFeedbackState();
}

class _QuizzFeedbackState extends State<QuizzFeedback> {
  @override
  Widget build(BuildContext context) {
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
            FixedSpacer.vSmallest,
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Na cor vermelha a resposta correta, na cor verde a sua resposta',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: ColorsContants.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FixedSpacer.vBiggest,
            QuizzText(
                color: ColorsContants.black,
                fontWeight: FontWeight.w500,
                text: "Qual o nome da maior floresta brasileira?".toUpperCase(),
                size: 26),
            FixedSpacer.vNormal,
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const Card(
                    elevation: 4,
                    color: ColorsContants.blue,
                    child: Text(
                      "Qual o nome da maior floresta brasileira?",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsContants.brown,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 36,
                width: 92,
                child: Card(
                  color: ColorsContants.blue,
                  elevation: 2,
                  child: InkWell(
                    onTap: () {},
                    child: const Center(
                      child: Text(
                        "Avançar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsContants.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
