import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state_app/app.dart';
import 'package:real_state_app/features/navigation/providers/bottom_navigation_provider.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DestinationChange()),
  ], child: const MyApp()));
}


