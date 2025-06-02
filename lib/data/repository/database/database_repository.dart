import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/database/models/property.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseRepository extends ChangeNotifier {
  final SupabaseClient supbaseClient;

  final List<Property> _properties = [];
  Property _propertyDetail = Property.empty();

  List<Property> get properties => _properties;

  Property get propertyDetail => _propertyDetail;

  DatabaseRepository(this.supbaseClient) {
    getProperties();
  }

  Future<void> getProperties() async {
    try {
      var response = await supbaseClient.from("properties").select();
      print('Response $response');
      for (var value in response) {
        _properties.add(Property.fromMap(value));
      }
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getPropertyId(int id) async {
    try {
      var response = await supbaseClient
          .from("properties")
          .select('*, agent:agent(*)')
          .eq('id', id)
          .single();
      _propertyDetail = Property.fromMap(response);
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }



}
