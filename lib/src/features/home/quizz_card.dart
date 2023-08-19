import 'package:fast_trivia/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widget/fixed_spacer.dart';

class QuizzCard extends StatelessWidget {
  const QuizzCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: ColorsContants.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsContants.white,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: const Icon(
                size: 18,
                Icons.check,
                color: ColorsContants.white,
              ),
            ),
          ),
          FixedSpacer.vSmaller,
          const Text(
            'X Questões',
            style: TextStyle(
              color: ColorsContants.white,
              fontSize: 16,
            ),
          ),
          const Text(
            'TEMA',
            style: TextStyle(
              color: ColorsContants.white,
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
