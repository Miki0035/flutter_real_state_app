import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/dummy_repository.dart';
import 'package:flutter_restate_app/features/home/models/apartment_model.dart';
import 'package:flutter_restate_app/utilis/classes/abstract_home_explore_search_provider_class.dart';

class HomeSearchBarProvider extends BaseSearchBarProvider {
  @override
  final query = TextEditingController();
  List<ApartmentModel> filteredApartments = [];
  String _searchText = "";
  Timer? _debounce;

  final List<ApartmentModel> apartments = dummyApartments;

  String get searchText => _searchText;

  HomeSearchBarProvider() {
    query.addListener(_onSearchChanged);
    filteredApartments = apartments;
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
    filteredApartments = apartments.where((apartment) {
      final matchesSearch =
          apartment.apartmentName.trim().toLowerCase().contains(searchText);

      final matchesFilter = selectedFilter.toLowerCase() == 'all' ||
          apartment.type.name.toLowerCase() == selectedFilter;
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
