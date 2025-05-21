import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';


class MApartementIconText extends StatelessWidget {
  const MApartementIconText(
      {super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: MColor.lightBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 1.0,
                color: MColor.lightBlue.withValues(alpha: 0.1),
              ),
            ),
            child: Image.asset(
              icon,
              width: 15,
              height: 15,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
