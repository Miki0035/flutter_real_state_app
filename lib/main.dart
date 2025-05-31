import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_restate_app/data/repository/database/database_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restate_app/app.dart';
import 'package:flutter_restate_app/data/repository/authentication/authentication_repository.dart';
import 'package:flutter_restate_app/features/explore/providers/explore_filter_tab_provider.dart';
import 'package:flutter_restate_app/features/explore/providers/explore_search_bar_provider.dart';
import 'package:flutter_restate_app/features/home/providers/home_filter_tab_provider.dart';
import 'package:flutter_restate_app/features/home/providers/home_search_bar_provider.dart';
import 'package:flutter_restate_app/features/navigation/providers/bottom_navigation_provider.dart';
import 'package:flutter_restate_app/utilis/networks/network_manager.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationRepository()),
    ChangeNotifierProvider(create: (_) => DatabaseRepository(AuthenticationRepository().client)),
    ChangeNotifierProvider(create: (_) => NetworkManager()),
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
    ChangeNotifierProvider(create: (_) => HomeSearchBarProvider()),
    ChangeNotifierProvider(create: (_) => HomeFilterTabProvider()),
    ChangeNotifierProvider(create: (_) => ExploreFilterTabProvider()),
    ChangeNotifierProvider(create: (_) => ExploreSearchBarProvider()),
  ], child: const MyApp()));
}
