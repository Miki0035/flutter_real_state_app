import 'package:flutter/material.dart';
import 'package:flutter_restate_app/utilis/devices/device_utility.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar({
    super.key,
    this.title,
    this.leading,
    this.showBackArrow = false,
    required this.actions,
  });

  final Widget? title;
  final Widget? leading;
  final bool showBackArrow;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        leading: leading,
        automaticallyImplyLeading: showBackArrow,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(MDeviceUtility.getAppBarHeight());
}
