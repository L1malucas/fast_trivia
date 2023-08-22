import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:fast_trivia/src/core/ui/widget/custom_loader.dart';
import 'package:fast_trivia/src/features/home/home_page.dart';
import 'package:fast_trivia/src/features/home/user_history.dart';
import 'package:fast_trivia/src/features/intro/intro_page.dart';
import 'package:fast_trivia/src/features/quizz/quizz_feedback.dart';
import 'package:fast_trivia/src/features/quizz/quizz_finish.dart';
import 'package:fast_trivia/src/features/quizz/quizz_game.dart';
import 'package:flutter/material.dart';

import 'core/ui/fast_trivia_theme.dart';
import 'features/splash_page.dart';

class FastTriviaApp extends StatelessWidget {
  const FastTriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const CustomLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          navigatorObservers: [asyncNavigatorObserver],
          title: 'Fast Trivia',
          theme: FastTriviaTheme.themeData,
          routes: {
            '/': (_) => const SplashPage(),
            '/intro': (_) => const IntroPage(),
            '/home/home': (_) => const HomePage(),
            '/home/user_history': (_) => const UserHistory(),
            '/quizz/quizz_game': (_) => const QuizzGame(),
            '/quizz/quizz_finish': (_) =>
                const QuizzFinish(points: 0, questionsLength: 0),
            '/quizz/quizz_feedback': (_) => const QuizzFeedback()
          },
        );
      },
    );
  }
}
