import 'package:flutter_restate_app/data/repository/database/models/agents.dart';
import 'package:flutter_restate_app/data/repository/database/models/gallery.dart';
import 'package:flutter_restate_app/data/repository/database/models/review.dart';
import 'package:latlng/latlng.dart';

class Property {
  final String image;
  final int id;
  final String name;
  final String type;
  final LatLng geolocation;
  late List<Gallery> galleries;
  late Agent? agent;
  final String description;
  final String address;
  final double rating;
  final double area;
  final int bedRooms;
  final int bathRooms;
  final int price;
  List<Review?> reviews;

  Property(
      {required this.image,
      required this.reviews,
      required this.id,
      required this.type,
      required this.galleries,
      required this.geolocation,
      required this.agent,
      required this.description,
      required this.address,
      required this.area,
      required this.bedRooms,
      required this.bathRooms,
      required this.price,
      required this.name,
      required this.rating});

  Map<String, dynamic> toMap() {
    return {
      "image": image,
      "type": type,
      "geolocation": geolocation,
      "agent": agent,
      "price": price,
      "address": address,
      "bed_rooms": bedRooms,
      "bath_rooms": bathRooms,
      "name": name,
      "rating": rating,
      "description": description,
      "area": area,
    };
  }
}
