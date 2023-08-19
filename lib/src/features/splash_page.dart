import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:fast_trivia/src/features/intro/intro_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _scale = 10.0;
  double _animationOpacityLogo = 0.0;
  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeight => 120 * _scale;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scale = 1.0;
        _animationOpacityLogo = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstants.backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            onEnd: () {
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    settings: const RouteSettings(name: '/intro'),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const IntroPage();
                    },
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                  (route) => false);
            },
            curve: Curves.easeIn,
            opacity: _animationOpacityLogo,
            duration: const Duration(seconds: 4),
            child: AnimatedContainer(
                width: _logoAnimationWidth,
                height: _logoAnimationHeight,
                curve: Curves.linearToEaseOut,
                duration: const Duration(seconds: 4),
                child: Container()),
          ),
        ),
      ),
    );
  }
}
