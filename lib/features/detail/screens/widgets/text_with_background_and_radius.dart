import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';

class MTextBackgroundRadius extends StatelessWidget {
  const MTextBackgroundRadius({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      decoration: BoxDecoration(
          border: Border.all(color: MColor.lightBlue.withValues(alpha: 0.1)),
          color: MColor.lightBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(24.0)),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
              color: MColor.blue, fontSize: 10.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
