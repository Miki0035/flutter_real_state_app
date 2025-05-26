import 'package:flutter/material.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';

import '../../../utilis/constants/images.dart';

class MAppBarIconNotification extends StatelessWidget {
  const MAppBarIconNotification({
    super.key, required this.icon,
  });
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        MImage.bell,
        width: 25,
        height: 25,
      ),
      Positioned(
          right: 3,
          top: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                color: MColor.blue, borderRadius: BorderRadius.circular(10)),
          ))
    ]);
  }
}
