import 'package:flutter/material.dart';

sealed class ColorsContants {
  static const black = Color(0xFF0E1111);
  static const white = Color(0xFFFBFAF5);
  static const red = Color(0xFFB74333);
  static const blue = Color(0xFF05556b);
  static const brown = Color(0xFF231313);
}

sealed class FontsContants {
  static const fontFamily = 'Poppins';
}

sealed class LocalHost {
  static const ip = 'http://localhost:8080';
}

sealed class ImageConstants {
  static const backgroundImage = 'assets/images/backgroung.jpg';
  static const imageLogo = 'assets/images/imageLogo.jpg';
}

sealed class LinksConstants {
  static final Uri repoGithub =
      Uri.parse('https://github.com/L1malucas/fast_trivia/');
  static final Uri linkedinProfle =
      Uri.parse('https://www.linkedin.com/in/limalucasdev/');
}
