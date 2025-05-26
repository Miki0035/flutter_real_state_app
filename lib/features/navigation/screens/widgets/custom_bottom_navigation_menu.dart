import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restate_app/features/navigation/providers/bottom_navigation_provider.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MBottomNavigationMenu extends StatelessWidget {
  const MBottomNavigationMenu({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
  });

  final String icon;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (_, value, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => value.navigateTo(index),
            icon: Image(
              fit: BoxFit.fill,
              color: value.currentIndex == index
                  ? MColor.blue
                  : MColor.veryLightBlack,
              image: AssetImage(icon),
              width: 20,
              height: 20,
            ),
          ),
          Text(
            label,
            style: TextStyle(
                color: value.currentIndex == index
                    ? MColor.blue
                    : MColor.veryLightBlack,
                fontSize: MSize.fontSizeSm),
          ),
        ],
      ),
    );
  }
}
