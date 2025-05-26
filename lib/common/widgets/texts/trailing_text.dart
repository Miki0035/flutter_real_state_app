import 'package:flutter/material.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MTrailingText extends StatelessWidget {
  const MTrailingText({
    super.key,
    required this.text,
    this.color = MColor.blue,
    this.fontSize = MSize.fontSizeMd,
  });

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, color: color, fontWeight: FontWeight.w600),
    );
  }
}
