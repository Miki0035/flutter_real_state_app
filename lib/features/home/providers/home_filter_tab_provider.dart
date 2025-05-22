import 'package:flutter/material.dart';
import 'package:real_state_app/data/repository/dummy_repository.dart';

class HomeFilterTabProvider with ChangeNotifier {
  int selectedIndex = 0;
  final List<String> menus = dummyMenus;

  String get selectedFilter => menus[selectedIndex].toLowerCase();

  void changeIndex(int selected) {
    selectedIndex = selected;
    notifyListeners();
  }
}
