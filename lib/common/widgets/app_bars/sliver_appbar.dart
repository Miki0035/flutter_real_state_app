import 'package:flutter/material.dart';

class MSliverAppBar extends StatelessWidget {
  const MSliverAppBar(
      {super.key,
      this.title,
      this.leading,
      this.showBackArrow = false,
      required this.actions,
      this.centerTitle = false,
      this.image,
      this.height = 0.0});

  final Widget? title;
  final Widget? leading;
  final bool showBackArrow;
  final List<Widget> actions;
  final bool centerTitle;

  final Widget? image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        background: image
      ),
      centerTitle: centerTitle,
      leading: leading,
      automaticallyImplyLeading: showBackArrow,
      title: title,
      actions: actions,
    );
  }
}
