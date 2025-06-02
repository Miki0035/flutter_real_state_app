import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/database/database_repository.dart';
import 'package:flutter_restate_app/data/repository/database/models/property.dart';
import 'package:flutter_restate_app/utilis/classes/abstract_home_explore_search_provider_class.dart';

class HomeSearchBarProvider extends BaseSearchBarProvider {
  @override
  final query = TextEditingController();
  final DatabaseRepository dbRepo;
  List<Property> filteredApartments = [];
  List<Property> properties = [];

  String _searchText = "";
  Timer? _debounce;


  String get searchText => _searchText;

  HomeSearchBarProvider({ required this.dbRepo}) {
    query.addListener(_onSearchChanged);
    _init();
  }

  Future<void> _init() async {
    properties = dbRepo.properties;
    notifyListeners();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchText = query.text.trim().toLowerCase();
      notifyListeners();
    });
  }

  @override
  void search(String selectedFilter) {
    filteredApartments = properties.where((property) {
      final matchesSearch =
          property.name.trim().toLowerCase().contains(searchText);

      final matchesFilter = selectedFilter.toLowerCase() == 'all' ||
          property.type.toLowerCase() == selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _debounce?.cancel();
    query.dispose();
    super.dispose();
  }
}
