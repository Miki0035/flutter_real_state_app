import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MCustomListTile extends StatelessWidget {
  const MCustomListTile(
      {super.key,
      required this.icon,
      required this.title,
      this.showTrailing = true,
      this.color = MColor.black});

  final String icon;
  final String title;
  final bool showTrailing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: AssetImage(icon),
        width: 20,
        height: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: color,
            fontSize: MSize.fontSizeMd),
      ),
      trailing: showTrailing
          ? const Image(
              image: AssetImage(MImage.rightArrow),
              width: 20,
              height: 20,
            )
          : null,
    );
  }
}
