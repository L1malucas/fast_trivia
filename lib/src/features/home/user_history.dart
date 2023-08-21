import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/widget/fixed_spacer.dart';
import '../quizz/quizz_card_preview.dart';
import 'home_page.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed('/home/home');
                })),
        backgroundColor: ColorsContants.white,
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Histórico de quizz',
                    style: TextStyle(
                      color: ColorsContants.red,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                FixedSpacer.vSmallest,
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Escolha um quizz abaixo para conferir o gabarito',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: ColorsContants.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                FixedSpacer.vSmallest,
                QuizzCardPreview(
                  rightAnswers: 1,
                  backgroundColor: ColorsContants.grey,
                  questionsLenght: 2,
                  themeImage: ImageConstants.historyTheme,
                  themeName: 'História do Brasil',
                ),
                FixedSpacer.vSmaller,
                QuizzCardPreview(
                  rightAnswers: 0,
                  backgroundColor: ColorsContants.grey,
                  questionsLenght: 2,
                  themeImage: ImageConstants.scienceTheme,
                  themeName: 'Ciências Básicas',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
