import 'package:flutter/material.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MElevatedButton extends StatelessWidget {
  const MElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 4.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        backgroundColor: MColor.blue,
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: MSize.fontSizeMd,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
