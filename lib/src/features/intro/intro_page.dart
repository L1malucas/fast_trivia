import 'package:fast_trivia/src/core/ui/widget/fixed_spacer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/ui/constants.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsContants.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FixedSpacer.vSmall,
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/home/home',
                            );
                          },
                          child: const Text(
                            "Avançar",
                            style: TextStyle(
                                color: ColorsContants.brown,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      FixedSpacer.vNormal,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              child: const Text(
                                'Repositório',
                                style: TextStyle(
                                    color: ColorsContants.blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              onTap: () => launchUrl(LinksConstants.repoGithub,
                                  mode: LaunchMode.externalApplication),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              child: const Text(
                                'Contato',
                                style: TextStyle(
                                    color: ColorsContants.blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              onTap: () => launchUrl(LinksConstants.repoGithub,
                                  mode: LaunchMode.externalApplication),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
