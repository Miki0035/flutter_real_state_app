import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/themes/custom_theme/appbar_theme.dart';

class MAppTheme {
  MAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: MAppBarTheme.lightAppBarTheme,
  );
}
