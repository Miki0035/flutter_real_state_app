import 'package:flutter/material.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MLeadingText extends StatelessWidget {
  const MLeadingText(
      {super.key, required this.text, this.fontSize = MSize.fontSizeLg});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.visible,
      style: const TextStyle(
          fontSize: MSize.fontSizeLg, fontWeight: FontWeight.w600),
    );
  }
}
