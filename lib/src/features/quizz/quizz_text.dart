import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';

class QuizzText extends StatelessWidget {
  const QuizzText({
    super.key,
    required this.text,
    required this.size,
    this.width,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.color,
  });

  final String text;
  final double size;
  final double? width;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Text(
        maxLines: maxLines ?? 3,
        text,
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
          color: color ?? ColorsContants.white,
          fontWeight: fontWeight,
          fontSize: size,
        ),
      ),
    );
  }
}
