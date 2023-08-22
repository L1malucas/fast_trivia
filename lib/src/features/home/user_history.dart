import 'package:flutter/material.dart';

import '../../core/providers/storage_provider.dart';
import '../../core/ui/constants.dart';
import '../../core/ui/widget/fixed_spacer.dart';
import '../../models/quiz_model.dart';
import '../quizz/quizz_card_preview.dart';
import 'home_page.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  List<QuizzModel> questionarios = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      requestList();
    });
  }

  Future<void> requestList() async {
    List<QuizzModel> quizzList =
        await StorageProvider.getQuizzFromSharedPreferences();
    setState(() {
      questionarios = quizzList;
    });
  }

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
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
                const SizedBox(
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
                  backgroundColor: ColorsContants.grey,
                  themeImage: ImageConstants.historyTheme,
                  iconData: Icons.check_rounded,
                  rightAnswers: 0,
                  quizzModel: questionarios[0],
                ),
                FixedSpacer.vSmaller,
                QuizzCardPreview(
                  quizzModel: questionarios[1],
                  iconData: Icons.check_rounded,
                  rightAnswers: 0,
                  backgroundColor: ColorsContants.grey,
                  themeImage: ImageConstants.scienceTheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
