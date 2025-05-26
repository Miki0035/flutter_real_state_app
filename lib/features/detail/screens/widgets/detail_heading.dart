import 'package:flutter/material.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MDetailHeading extends StatelessWidget {
  const MDetailHeading({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: MSize.fontSizeLg),
    );
  }
}
