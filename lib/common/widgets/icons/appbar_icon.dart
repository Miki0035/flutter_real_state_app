import 'package:flutter/material.dart';

class MAppBarIcon extends StatelessWidget {
  const MAppBarIcon(
      {super.key,
      required this.icon,
      this.size = 30,
      this.backgroundColor = Colors.black});

  final String icon;
  final Color backgroundColor;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      color: backgroundColor,
      width: size,
      height: size,
    );
  }
}
