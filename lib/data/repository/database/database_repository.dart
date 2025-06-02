import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/database/models/property.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseRepository extends ChangeNotifier {
  final SupabaseClient supbaseClient;

  final List<Property> properties = [];

  DatabaseRepository(this.supbaseClient);
}
