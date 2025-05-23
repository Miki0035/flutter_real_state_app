import 'package:flutter/material.dart';
import 'package:real_state_app/features/explore/screens/explore.dart';
import 'package:real_state_app/features/home/screens/home.dart';
import 'package:real_state_app/features/profile/screens/profile.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  final List<Widget> appScreens = [
    const MHomeScreen(),
    MExploreScreen(),
    MProfileScreen(),
  ];

  int get currentIndex => _selectedIndex;

  Widget get currentScreen => appScreens[_selectedIndex];

  void navigateTo(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
