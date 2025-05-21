import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MTrailingText extends StatelessWidget {
  const MTrailingText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: MSize.fontSizeMd,
          color: MColor.blue,
          fontWeight: FontWeight.w600),
    );
  }
}
