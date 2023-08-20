import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:fast_trivia/src/core/ui/widget/custom_loader.dart';
import 'package:fast_trivia/src/features/home/home_page.dart';
import 'package:fast_trivia/src/features/intro/intro_page.dart';
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
            '/home/home': (_) => const HomePage()
          },
        );
      },
    );
  }
}
