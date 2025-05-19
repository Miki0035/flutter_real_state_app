import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MHeadline extends StatelessWidget {
  const MHeadline(
      {super.key, required this.leadingText, this.trailingText = ""});

  final String leadingText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            leadingText,
            style: const TextStyle(
                fontSize: MSize.fontSizeLg, fontWeight: FontWeight.w600),
          ),
        ),
        if (trailingText.isNotEmpty)
          Text(
            trailingText,
            style: const TextStyle(
                fontSize: MSize.fontSizeMd,
                color: MColor.blue,
                fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}
