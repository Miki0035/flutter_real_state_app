import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';
import 'package:real_state_app/utilis/devices/device_utility.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar({
    super.key,
    required this.title,
    this.leading,
    this.showBackArrow = false,
  });

  final String title;
  final Widget? leading;
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        leading: leading,
        automaticallyImplyLeading: showBackArrow,
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: MSize.fontSizeLg * 1.3),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(MDeviceUtility.getAppBarHeight());
}
