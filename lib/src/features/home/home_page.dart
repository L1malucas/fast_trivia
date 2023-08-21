import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fast_trivia/src/features/quizz/quizz_card_preview.dart';
import '../../core/ui/widget/fixed_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/home/user_history',
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
                    QuizzCardPreview(
                      backgroundColor: ColorsContants.blue,
                      iconData: Icons.play_arrow_rounded,
                      questionsLenght: 2,
                      themeImage: ImageConstants.historyTheme,
                      themeName: 'História do Brasil',
                    ),
                    FixedSpacer.vSmaller,
                    QuizzCardPreview(
                      backgroundColor: ColorsContants.brown,
                      iconData: Icons.check_box,
                      questionsLenght: 2,
                      themeImage: ImageConstants.scienceTheme,
                      themeName: 'Ciências Básicas',
                    ),
                    FixedSpacer.vSmaller,
                    QuizzCardPreview(
                      backgroundColor: ColorsContants.red,
                      iconData: Icons.play_arrow_rounded,
                      questionsLenght: 2,
                      themeImage: ImageConstants.natureTheme,
                      themeName: 'Natureza Brasileira',
                    ),
                    FixedSpacer.vSmaller,
                    QuizzCardPreview(
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
      ),
    );
  }
}
