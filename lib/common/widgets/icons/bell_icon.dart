import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';

import '../../../utilis/constants/images.dart';

class MBellIcon extends StatelessWidget {
  const MBellIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        MImage.bell,
        width: 30,
        height: 30,
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
