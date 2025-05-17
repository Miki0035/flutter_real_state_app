import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';

class MBackButton extends StatelessWidget {
  const MBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: MColor.lightBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          MImage.backArrow,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
