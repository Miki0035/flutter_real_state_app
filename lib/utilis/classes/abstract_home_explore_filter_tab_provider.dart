import 'package:flutter/material.dart';

abstract class BaseFilterTabProvider extends ChangeNotifier {
  void changeIndex(int selectedIndex);
}
