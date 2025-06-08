import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/database/database_repository.dart';
import 'package:provider/provider.dart';
import 'explore_search_bar_provider.dart';

class ExploreFilterTabProvider with ChangeNotifier {
  int selectedIndex = 0;
  final DatabaseRepository dbRepo;
  List<String> menus = [];

  String get selectedFilter => menus[selectedIndex].toLowerCase();

  ExploreFilterTabProvider({required this.dbRepo}) {
    menus = dbRepo.menus;
    notifyListeners();
  }

  void changeIndex(int selected, BuildContext context) {
    selectedIndex = selected;
    notifyListeners();

    // After notifying listeners, trigger filtering in the other provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExploreSearchBarProvider>().search(selectedFilter);
    });
  }
}
