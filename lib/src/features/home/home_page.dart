import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/features/home/quizz_card.dart';
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
                onPressed: () {}, icon: const Icon(Icons.history_rounded)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.admin_panel_settings_rounded)),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
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
                      'Escolha um quizz abaixo',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorsContants.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  FixedSpacer.vSmallest,
                  QuizzCard(),
                  FixedSpacer.vSmaller,
                  QuizzCard(),
                  FixedSpacer.vSmaller,
                  QuizzCard(),
                  FixedSpacer.vSmaller,
                  QuizzCard(),
                  FixedSpacer.vSmaller,
                  QuizzCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
