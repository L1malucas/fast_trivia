import 'package:fast_trivia/src/core/providers/storage_provider.dart';
import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/core/ui/widget/custom_loader.dart';
import 'package:fast_trivia/src/models/quiz_model.dart';
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
  List<QuizzModel> questionarios = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await requestList();
      setState(() {
        loading = false;
      });
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
        await StorageProvider.clearQuizzDataFromSharedPreferences();
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
        body: loading
            ? const CustomLoader()
            : Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
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
                          const SizedBox(
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
                            quizzModel: questionarios[0],
                            backgroundColor: ColorsContants.blue,
                            iconData: Icons.play_arrow_rounded,
                            themeImage: ImageConstants.natureTheme,
                          ),
                          FixedSpacer.vSmaller,
                          QuizzCardPreview(
                            quizzModel: questionarios[1],
                            backgroundColor: ColorsContants.brown,
                            iconData: Icons.check_rounded,
                            themeImage: ImageConstants.salvadorTheme,
                          ),
                          FixedSpacer.vSmaller,
                          QuizzCardPreview(
                            quizzModel: questionarios[2],
                            backgroundColor: ColorsContants.red,
                            iconData: Icons.play_arrow_rounded,
                            themeImage: ImageConstants.historyTheme,
                          ),
                          FixedSpacer.vSmaller,
                          QuizzCardPreview(
                            quizzModel: questionarios[3],
                            backgroundColor: ColorsContants.blue,
                            iconData: Icons.check_rounded,
                            themeImage: ImageConstants.scienceTheme,
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
