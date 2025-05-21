import 'package:flutter/material.dart';


class MAppBarIcon extends StatelessWidget {
  const MAppBarIcon(
      {super.key,
      required this.icon,
      this.backgroundColor = Colors.black});

  final String icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      color: backgroundColor,
      width: 30,
      height: 30,
    );
  }
}
