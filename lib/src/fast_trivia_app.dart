import 'package:fast_trivia/src/features/home/home_page.dart';
import 'package:fast_trivia/src/features/intro/intro_page.dart';
import 'package:flutter/material.dart';

import 'core/ui/fast_trivia_theme.dart';
import 'features/splash_page.dart';

class FastTriviaApp extends StatelessWidget {
  const FastTriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Trivia',
      theme: FastTriviaTheme.themeData,
      routes: {
        '/': (_) => const SplashPage(),
        '/intro': (_)=> const IntroPage(),
        '/home/home': (_) => const HomePage()
      },
    );
  }
}
