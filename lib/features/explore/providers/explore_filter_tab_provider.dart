import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state_app/data/repository/dummy_repository.dart';

import 'explore_search_bar_provider.dart';

class ExploreFilterTabProvider with ChangeNotifier {
  int selectedIndex = 0;
  final List<String> menus = dummyMenus;

  String get selectedFilter => menus[selectedIndex].toLowerCase();

  void changeIndex(int selected, BuildContext context) {
    selectedIndex = selected;
    notifyListeners();

    // After notifying listeners, trigger filtering in the other provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExploreSearchBarProvider>().search(selectedFilter);
    });
  }
}
