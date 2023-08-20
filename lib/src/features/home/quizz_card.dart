import 'package:flutter/material.dart';
import '../../core/ui/constants.dart';
import '../../core/ui/widget/fixed_spacer.dart';

class QuizzCard extends StatelessWidget {
  const QuizzCard(
      {Key? key,
      required this.questionsLenght,
      required this.themeName,
      required this.themeImage})
      : super(key: key);

  final int questionsLenght;
  final String themeName;
  final String themeImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: ColorsContants.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                height: 64,
                child: Text(
                  themeName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ColorsContants.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FixedSpacer.vSmaller,
              Text(
                '$questionsLenght Questões',
                style: const TextStyle(
                  color: ColorsContants.white,
                  fontSize: 16,
                ),
              ),
              FixedSpacer.vSmaller,
              const Icon(
                size: 15,
                Icons.check,
                color: ColorsContants.white,
              ),
            ],
          ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0 - 2.0),
              child: Image.asset(
                themeImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
