import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state_app/data/repository/authentication_repository.dart';
import 'package:real_state_app/features/login/screens/login.dart';
import 'package:real_state_app/features/navigation/screens/bottom_navigation.dart';
import 'package:real_state_app/utilis/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationRepository>(
        builder: (_, auth, __) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MAppTheme.lightTheme,
            home: auth.status != AuthStatus.authenticated
                ? const LoginScreen()
                : MBottomNavigation()));
  }
}
