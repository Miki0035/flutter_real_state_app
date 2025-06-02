import 'package:flutter_restate_app/data/repository/database/models/agents.dart';

class Property {
  final int id;
  final String image;
  final String name;
  final String type;
  final String geolocation;
  final Agent agent;
  final String description;
  final String address;
  final double rating;
  final int area;
  final int bedRooms;
  final int bathRooms;
  final int price;

  Property(
      {required this.id,
      required this.image,
      required this.type,
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

  factory Property.fromMap(Map<String, dynamic> property) {
    return Property(
      id: property['id'] as int,
      image: property['image'] as String,
      type: property['type'] as String,
      geolocation: property['geolocation'] as String,
      agent: Agent.fromMap(property['agent']),
      price: property['price'] as int,
      bathRooms: property['bath_rooms'] as int,
      bedRooms: property['bed_rooms'] as int,
      name: property['name'] as String,
      rating: property['rating'] as double,
      description: property['description'] as String,
      area: property['area'] as int,
      address: property['address'] as String,
    );
  }

  factory Property.empty() {
    return Property(
      id: 0,
      image: "",
      type: "",
      geolocation: "",
      agent: Agent.empty(),
      price: 0,
      bathRooms: 0,
      bedRooms: 0,
      name: "",
      rating: 0.0,
      description: "",
      area: 0,
      address: "",
    );
  }
}
