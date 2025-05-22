import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MHomeMenu extends StatelessWidget {
  const MHomeMenu({
    super.key,
    required this.menu,
    required this.index,
    required this.selectedIndex,
  });

  final String menu;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10.0, horizontal: MSize.defaultSpace),
      decoration: BoxDecoration(
          border: Border.all(color: MColor.lightBlue.withValues(alpha: 0.1)),
          color: index == selectedIndex
              ? MColor.blue
              : MColor.lightBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(24.0)),
      child: Center(
        child: Text(
          menu,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: index == selectedIndex ? Colors.white : MColor.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
