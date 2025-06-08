import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/database/database_repository.dart';

class HomeFilterTabProvider with ChangeNotifier {
  int selectedIndex = 0;
  final DatabaseRepository dbRepo;
  List<String> menus = [];

  String get selectedFilter => menus[selectedIndex].toLowerCase();

  HomeFilterTabProvider({ required this.dbRepo }) {
    menus = dbRepo.menus;
  }

  void changeIndex(int selected) {
    selectedIndex = selected;
    notifyListeners();
  }
}
