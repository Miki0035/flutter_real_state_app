import 'package:flutter/material.dart';

abstract class BaseSearchBarProvider extends ChangeNotifier {
  TextEditingController get query;
  void search(String selectedFilter);
}
