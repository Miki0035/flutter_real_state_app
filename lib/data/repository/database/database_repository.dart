import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/database/models/property.dart';
import 'package:provider/provider.dart';

class DatabaseRepository extends ChangeNotifier {
  final supbaseClient;

  final List<Property> properties = [];

  DatabaseRepository(this.supbaseClient){
    getProperties();
  }

  Future<void> getProperties() async {
    try {
      final response = await supbaseClient.from("properties").select();
      if (response.data != null) {
        print('Response: ${response.data}');
      }
    } catch (e) {
      print('Error getting properties: $e');
    } finally {
      notifyListeners();
    }
  }
}
