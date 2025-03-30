import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state_app/features/navigation/models/navigation_menu.dart';
import 'package:real_state_app/features/navigation/providers/bottom_navigation_provider.dart';
import 'package:real_state_app/features/navigation/screens/widgets/custom_bottom_navigation_menu.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/texts.dart';

class MBottomNavigation extends StatelessWidget {
  MBottomNavigation({super.key});

  final List<MNavigationMenu> navMenu = [
    MNavigationMenu(icon: MImage.home, label: MText.home),
    MNavigationMenu(icon: MImage.search, label: MText.explore),
    MNavigationMenu(icon: MImage.person, label: MText.profile),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DestinationChange>(
      builder: (context, value, child) => Scaffold(
        body: value.currentScreen,
        bottomNavigationBar: NavigationBar(
          elevation: 1.0,
          backgroundColor: Colors.transparent,
          selectedIndex: value.currentIndex,
          destinations: List.generate(navMenu.length, (index) =>
              MBottomNavigationMenu(
                index: index,
                icon: navMenu[index].icon,
                label: navMenu[index].label,
              ))
              .toList(),
        ),
      ),
    );
  }
}
