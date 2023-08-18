import 'package:flutter/material.dart';

import 'core/ui/fast_trivia_theme.dart';
import 'features/splash_page.dart';

class FastTrivia extends StatelessWidget {
  const FastTrivia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Trivia',
      theme: FastTriviaTheme.themeData,
      routes: {'/': (_) => const SplashPage()},
    );
  }
}
