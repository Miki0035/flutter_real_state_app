import 'package:firebase_core/firebase_core.dart';
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

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationRepository()),
    ChangeNotifierProvider(create: (_) => DatabaseRepository()),
    ChangeNotifierProvider(create: (_) => NetworkManager()),
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
    ChangeNotifierProxyProvider<DatabaseRepository, HomeSearchBarProvider>(
      create: (context) => HomeSearchBarProvider(
        dbRepo: Provider.of<DatabaseRepository>(context, listen: false),
      ),
      update: (context, dbRepo, previous) =>
          HomeSearchBarProvider(dbRepo: dbRepo),
    ),
    ChangeNotifierProxyProvider<DatabaseRepository, HomeFilterTabProvider>(
      create: (context) => HomeFilterTabProvider(
        dbRepo: Provider.of<DatabaseRepository>(context, listen: false),
      ),
      update: (context, dbRepo, previous) =>
          HomeFilterTabProvider(dbRepo: dbRepo),
    ),
    ChangeNotifierProxyProvider<DatabaseRepository, ExploreSearchBarProvider>(
      create: (context) => ExploreSearchBarProvider(
        dbRepo: Provider.of<DatabaseRepository>(context, listen: false),
      ),
      update: (context, dbRepo, previous) =>
          ExploreSearchBarProvider(dbRepo: dbRepo),
    ),
    ChangeNotifierProxyProvider<DatabaseRepository, ExploreFilterTabProvider>(
      create: (context) => ExploreFilterTabProvider(
        dbRepo: Provider.of<DatabaseRepository>(context, listen: false),
      ),
      update: (context, dbRepo, previous) =>
          ExploreFilterTabProvider(dbRepo: dbRepo),
    ),
  ], child: const MyApp()));
}
