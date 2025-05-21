import 'package:flutter/material.dart';

class MHeadline extends StatelessWidget {
  const MHeadline(
      {super.key, required this.leading, this.trailing});

  final Widget leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: leading
        ),

        if(trailing != null) trailing!

      ],
    );
  }
}
