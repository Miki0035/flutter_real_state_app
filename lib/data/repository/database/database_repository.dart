import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/database/models/agents.dart';
import 'package:flutter_restate_app/data/repository/database/models/gallery.dart';
import 'package:flutter_restate_app/data/repository/database/models/property.dart';
import 'package:flutter_restate_app/data/repository/database/models/review.dart';
import 'package:flutter_restate_app/features/home/models/apartment_model.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:latlng/latlng.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseRepository extends ChangeNotifier {
  final SupabaseClient supbaseClient;

  final List<Gallery> galleries = [
    Gallery(
      image: MImage.japan,
      property: 0,
    ),
    Gallery(
      image: MImage.newYork,
      property: 1,
    ),
    Gallery(
      image: MImage.apartmentOne,
      property: 2,
    ),
    Gallery(
      image: MImage.apartmentTwo,
      property: 3,
    ),
    Gallery(
      image: MImage.barOne,
      property: 4,
    ),
    Gallery(
      image: MImage.bedOne,
      property: 5,
    ),
    Gallery(
      image: MImage.kitchenOne,
      property: 6,
    ),
    Gallery(
      image: MImage.kitchenTwo,
      property: 7,
    ),
    Gallery(
      image: MImage.livingRoomOne,
      property: 8,
    ),
    Gallery(
      image: MImage.livingRoomTwo,
      property: 9,
    ),
    Gallery(
      image: MImage.newYork, // Matches with "Merialla Villa" in NY
      property: 0,
    ),
    Gallery(
      image: MImage.livingRoomOne, // Luxury villa with great living room
      property: 7,
    ),
    Gallery(
      image: MImage.apartmentOne, // Downtown condo
      property: 2,
    ),
    Gallery(
      image: MImage.kitchenOne, // House in Seattle
      property: 7,
    ),
    Gallery(
      image: MImage.barOne, // Luxury apartment in Boston
      property: 4,
    ),
    Gallery(
      image: MImage.bedOne, // Beach House
      property: 5,
    ),
    Gallery(
      image: MImage.apartmentTwo, // Modern Flat
      property: 6,
    ),
    Gallery(
      image: MImage.kitchenTwo, // Villa with Golden Gate view
      property: 7,
    ),
    Gallery(
      image: MImage.japan, // Mountain Nest – serene feel
      property: 8,
    ),
    Gallery(
      image: MImage.livingRoomTwo, // Suburban Charm
      property: 9,
    ),
  ];
  final List<Agent> agents = [
    Agent(
      id: 0,
      avatar: MImage.person,
      name: 'Sophia Williams',
      email: 'sophia.williams@example.com',
    ),
    Agent(
      id: 1,
      avatar: MImage.avatar,
      name: 'James Anderson',
      email: 'james.anderson@example.com',
    ),
    Agent(
      id: 2,
      avatar: MImage.people,
      name: 'Liam Johnson',
      email: 'liam.johnson@example.com',
    ),
  ];
  final List<Review> reviews = [
    Review(
      avatar:
          "https://images.unsplash.com/photo-1474176857210-7287d38d27c6?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 0,
      name: 'Emily Clark',
      review:
          'Beautiful villa in a great neighborhood. Would love to stay again!',
      rating: 4.5,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1511551203524-9a24350a5771?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 1,
      name: 'Michael Lee',
      review: 'Spacious and clean. The sunset view was amazing!',
      rating: 4.8,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1507591064344-4c6ce005b128?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 2,
      name: 'Sarah Kim',
      review: 'Perfect location for exploring the city. Modern and cozy.',
      rating: 4.2,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 3,
      name: 'David Johnson',
      review: 'A bit small, but very charming. Loved the rainy ambiance.',
      rating: 3.9,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1517331671191-ddc2c6d3ebd1?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 4,
      name: 'Natalie Perez',
      review: 'Amazing view of the harbor. Very luxurious experience.',
      rating: 5.0,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1474176857210-7287d38d27c6?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 9,
      name: 'Emily Clark',
      review:
          'Beautiful villa in a great neighborhood. Would love to stay again!',
      rating: 4.5,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1511551203524-9a24350a5771?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 8,
      name: 'Michael Lee',
      review: 'Spacious and clean. The sunset view was amazing!',
      rating: 4.8,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1507591064344-4c6ce005b128?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 7,
      name: 'Sarah Kim',
      review: 'Perfect location for exploring the city. Modern and cozy.',
      rating: 4.2,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 6,
      name: 'David Johnson',
      review: 'A bit small, but very charming. Loved the rainy ambiance.',
      rating: 3.9,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1517331671191-ddc2c6d3ebd1?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 5,
      name: 'Natalie Perez',
      review: 'Amazing view of the harbor. Very luxurious experience.',
      rating: 5.0,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1474176857210-7287d38d27c6?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 2,
      name: 'Emily Clark',
      review:
          'Beautiful villa in a great neighborhood. Would love to stay again!',
      rating: 4.5,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1511551203524-9a24350a5771?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 6,
      name: 'Michael Lee',
      review: 'Spacious and clean. The sunset view was amazing!',
      rating: 4.8,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1507591064344-4c6ce005b128?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 5,
      name: 'Sarah Kim',
      review: 'Perfect location for exploring the city. Modern and cozy.',
      rating: 4.2,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 0,
      name: 'David Johnson',
      review: 'A bit small, but very charming. Loved the rainy ambiance.',
      rating: 3.9,
    ),
    Review(
      avatar:
          "https://images.unsplash.com/photo-1517331671191-ddc2c6d3ebd1?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      property: 0,
      name: 'Natalie Perez',
      review: 'Amazing view of the harbor. Very luxurious experience.',
      rating: 5.0,
    ),
  ];

  //PROPERTIES
  List<Property> properties = [
    Property(
        id: 0,
        image: MImage.newYork,
        name: "Merialla Villa",
        address: "New York, US",
        rating: 3.0,
        price: 1222,
        type: Type.house.name,
        bedRooms: 3,
        bathRooms: 2,
        geolocation:
            const LatLng(Angle.degree(40.7128), Angle.degree(-74.0060)),
        agent: null,
        description: 'A cozy villa in New York.',
        area: 1500,
        galleries: [],
        reviews: []),
    Property(
        id: 1,
        image: MImage.japan,
        name: "Sunset Villa",
        address: "Los Angeles, US",
        rating: 3.0,
        price: 1222,
        type: Type.villa.name,
        bedRooms: 4,
        bathRooms: 3,
        geolocation:
            const LatLng(Angle.degree(47.6062), Angle.degree(-122.3321)),
        agent: null,
        description: 'Spacious villa with sunset view.',
        area: 1500,
        galleries: [],
        reviews: []),
    Property(
      id: 2,
      image: MImage.apartmentOne,
      name: "Rainy Retreat",
      address: "Seattle, US",
      rating: 3.3,
      price: 2000,
      type: Type.apartments.name,
      bedRooms: 3,
      bathRooms: 1,
      geolocation: const LatLng(Angle.degree(47.6062), Angle.degree(-122.3321)),
      agent: null,
      description: 'Charming home with rainy ambiance.',
      area: 1400,
      galleries: [],
      reviews: [],
    ),
    Property(
      id: 3,
      image: MImage.barOne,
      name: "Harbor View",
      address: "Boston, US",
      rating: 2.5,
      price: 2580,
      type: Type.others.name,
      bedRooms: 2,
      bathRooms: 2,
      geolocation: const LatLng(Angle.degree(42.3601), Angle.degree(-71.0589)),
      agent: null,
      description: 'Luxury apartment with harbor view.',
      area: 1200,
      galleries: [],
      reviews: [],
    ),
    Property(
        id: 4,
        image: MImage.livingRoomTwo,
        name: "Beach House",
        address: "Miami, US",
        rating: 4.8,
        price: 4100,
        type: Type.house.name,
        bedRooms: 5,
        bathRooms: 4,
        geolocation:
            const LatLng(Angle.degree(25.7617), Angle.degree(-80.1918)),
        agent: null,
        description: 'Beachfront property with private pool.',
        area: 3000,
        galleries: [],
        reviews: []),
    Property(
        id: 6,
        image: MImage.apartmentTwo,
        name: "Modern Flat",
        address: "Austin, US",
        rating: 4.1,
        price: 1600,
        type: Type.apartments.name,
        bedRooms: 1,
        bathRooms: 1,
        geolocation:
            const LatLng(Angle.degree(30.2672), Angle.degree(-97.7431)),
        agent: null,
        description: 'Compact modern apartment downtown.',
        area: 800,
        galleries: [],
        reviews: []),
    Property(
      id: 7,
      image: MImage.kitchenTwo,
      name: "Golden Gate View",
      address: "San Francisco, US",
      rating: 4.7,
      price: 3750,
      type: Type.villa.name,
      bedRooms: 3,
      bathRooms: 3,
      geolocation: const LatLng(Angle.degree(37.7749), Angle.degree(-122.4194)),
      agent: null,
      description: 'Elegant villa with stunning views.',
      area: 2000,
      galleries: [],
      reviews: [],
    ),
    Property(
      id: 8,
      image: MImage.kitchenOne,
      name: "Mountain Nest",
      address: "Denver, US",
      rating: 4.3,
      price: 2300,
      type: Type.house.name,
      bedRooms: 4,
      bathRooms: 2,
      geolocation: const LatLng(Angle.degree(39.7392), Angle.degree(-104.9903)),
      agent: null,
      description: 'Perfect home for mountain lovers.',
      area: 1800,
      galleries: [],
      reviews: [],
    ),
    Property(
      id: 9,
      image: MImage.livingRoomTwo,
      name: "Suburban Charm",
      address: "Atlanta, US",
      rating: 3.9,
      price: 1500,
      type: Type.house.name,
      bedRooms: 3,
      bathRooms: 2,
      geolocation: const LatLng(Angle.degree(33.7490), Angle.degree(-84.3880)),
      agent: null,
      description: 'Family-friendly home in the suburbs.',
      area: 1600,
      galleries: [],
      reviews: [],
    ),
  ];

  final List<String> menus = ["All", "House", "Villa", "Apartments", "Others"];

  DatabaseRepository(this.supbaseClient);

  Property getProperty(int id) {
    final property = properties.firstWhere((property) => property.id == id);
    property.galleries =
        galleries.where((gallery) => gallery.property == property.id).toList();
    property.agent = agents[Random().nextInt(agents.length)];
    property.reviews = reviews.where((review) => review.property == property.id).toList();
    return property;
  }
}
