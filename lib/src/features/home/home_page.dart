import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/features/quizz/quizz_card.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widget/fixed_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsContants.white,
      appBar: AppBar(
        backgroundColor: ColorsContants.white,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/home/userHistory',
                  );
                },
                icon: const Icon(Icons.history_rounded)),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Vamos Jogar',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorsContants.red,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Escolha um quizz abaixo para iniciar',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorsContants.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  FixedSpacer.vSmallest,
                  QuizzCard(
                    backgroundColor: ColorsContants.blue,
                    iconData: Icons.play_arrow_rounded,
                    questionsLenght: 2,
                    themeImage: ImageConstants.historyTheme,
                    themeName: 'História do Brasil',
                  ),
                  FixedSpacer.vSmaller,
                  QuizzCard(
                    backgroundColor: ColorsContants.brown,
                    iconData: Icons.check_box,
                    questionsLenght: 2,
                    themeImage: ImageConstants.scienceTheme,
                    themeName: 'Ciências Básicas',
                  ),
                  FixedSpacer.vSmaller,
                  QuizzCard(
                    backgroundColor: ColorsContants.red,
                    iconData: Icons.play_arrow_rounded,
                    questionsLenght: 2,
                    themeImage: ImageConstants.natureTheme,
                    themeName: 'Natureza Brasileira',
                  ),
                  FixedSpacer.vSmaller,
                  QuizzCard(
                    backgroundColor: ColorsContants.blue,
                    iconData: Icons.check_box,
                    questionsLenght: 2,
                    themeImage: ImageConstants.salvadorTheme,
                    themeName: 'Cidade de Salvador',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
