import 'package:flutter/material.dart';
import 'package:real_state_app/features/login/screens/login.dart';
import 'package:real_state_app/utilis/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MAppTheme.lightTheme,
      home: const LoginScreen()
    );
  }
}
