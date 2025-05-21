import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MDetailVerticalIconText extends StatelessWidget {
  const MDetailVerticalIconText({
    super.key,
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: MColor.lightBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Image.asset(
            icon,
            color: MColor.blue,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: MSize.fontSizeSm),
        ),
      ],
    );
  }
}
