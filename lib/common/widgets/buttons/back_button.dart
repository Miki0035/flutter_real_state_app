import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';

class MBackButton extends StatelessWidget {
  const MBackButton(
      {super.key, this.onPressed, this.backgroundColor = MColor.lightBlue});

  final VoidCallback? onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.1),
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
