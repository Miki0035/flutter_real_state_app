import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MLeadingText extends StatelessWidget {
  const MLeadingText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: MSize.fontSizeLg, fontWeight: FontWeight.w600),
    );
  }
}
