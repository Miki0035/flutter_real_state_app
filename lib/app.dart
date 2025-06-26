import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restate_app/common/widgets/layouts/mobile_view_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restate_app/data/repository/authentication/authentication_repository.dart';
import 'package:flutter_restate_app/features/login/screens/login.dart';
import 'package:flutter_restate_app/features/navigation/screens/bottom_navigation.dart';
import 'package:flutter_restate_app/utilis/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final isMobile = !kIsWeb;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Consumer<AuthenticationRepository>(
          builder: (_, auth, __) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: MAppTheme.lightTheme,
              home: auth.user != null
                  ? MBottomNavigation()
                  : const LoginScreen()));
    } else {
      return Consumer<AuthenticationRepository>(
          builder: (_, auth, __) => MobileViewWrapper(
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: MAppTheme.lightTheme,
                    home: auth.user != null
                        ? MBottomNavigation()
                        : const LoginScreen()),
              ));
    }
  }
}
