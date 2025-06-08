// import 'dart:math';
// import 'package:flutter_restate_app/data/repository/database/models/facility.dart';
// import 'package:flutter_restate_app/data/repository/database/models/property.dart';
// import 'package:flutter_restate_app/data/repository/database/models/review.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class Seed {
//   final SupabaseClient supbaseClient;
//
//   Seed(this.supbaseClient);
//
//   // final galleryImages = [
//   //   Gallery(
//   //     image:
//   //         "https://images.unsplash.com/photo-1560185009-dddeb820c7b7?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //   ),
//   //   Gallery(
//   //     image:
//   //         "https://images.unsplash.com/photo-1641910532059-ad684fd3049c?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //   ),
//   //   Gallery(
//   //     image:
//   //         "https://images.unsplash.com/photo-1621293954908-907159247fc8?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //   ),
//   //   Gallery(
//   //     image:
//   //         "https://images.unsplash.com/photo-1604328702728-d26d2062c20b?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //   ),
//   //   Gallery(
//   //     image:
//   //         "https://images.unsplash.com/photo-1600435335786-d74d2bb6de37?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //   ),
//   //   Gallery(
//   //     image:
//   //         "https://images.unsplash.com/photo-1560448204-603b3fc33ddc?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //   ),
//   //   Gallery(
//   //     image:
//   //         "https://images.unsplash.com/photo-1635108198979-9806fdf275c6?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //   ),
//   // ];
//   //
//   // final List<Agent> agents = [
//   //   Agent(
//   //       avatar:
//             "https://images.unsplash.com/photo-1691335053879-02096d6ee2ca?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //       name: "Bruce Wayne",
//   //       email: "agent1@restate.com"),
//   //   Agent(
//   //       avatar:
//             "https://images.unsplash.com/photo-1691335053879-02096d6ee2ca?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //       name: "Barry Allen",
//   //       email: "agent2@restate.com"),
//   //   Agent(
//   //       avatar:
//             "https://images.unsplash.com/photo-1691335053879-02096d6ee2ca?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //       name: "Tony Stark",
//   //       email: "agent3@restate.com"),
//   //   Agent(
//   //       avatar:
//   //           "https://images.unsplash.com/photo-1691335053879-02096d6ee2ca?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //       name: "Clark Kent",
//   //       email: "agent4@restate.com"),
//   //   Agent(
//   //       avatar:
//   //           "https://images.unsplash.com/photo-1691335053879-02096d6ee2ca?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   //       name: "Steven Strange",
//   //       email: "agent5@restate.com"),
//   // ];
//
//   static const reviewImages = [
//     "https://images.unsplash.com/photo-1517331671191-ddc2c6d3ebd1?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1474176857210-7287d38d27c6?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1511551203524-9a24350a5771?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1507591064344-4c6ce005b128?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   ];
//
//   static const propertiesImages = [
//     "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1605146768851-eda79da39897?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1561753757-d8880c5a3551?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1551241090-67de81d3541c?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1697299262049-e9b5fa1e9761?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1719299225324-301bad5c333c?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1582063289852-62e3ba2747f8?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1516095901529-0ef7be431a4f?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1600585153490-76fb20a32601?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1605276373954-0c4a0dac5b12?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1720432972486-2d53db5badf0?q=60&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//   ];
//
//   static const facilities = [
//     "Laundry",
//     "Car Parking",
//     "Sports Center",
//     "Cutlery",
//     "Gym",
//     "Swimming pool",
//     "Wifi",
//     "Pet Center",
//   ];
//
//   static const propertyTypes = [
//     "House",
//     "Townhomes",
//     "Condos",
//     "Duplexes",
//     "Studios",
//     "Villa",
//     "Apartments",
//     "Others",
//   ];
//
//   static const agents = [3, 4, 5, 6, 7];
//
//   final List<Review> reviews = [];
//   final List<Facility> fs = [];
//   final List<Property> properties = [];
//
//   getReviews() {
//     for (int i = 1; i <= 10; i++) {
//       final review = Review(
//           avatar: reviewImages[
//               (reviewImages.length * Random().nextDouble()).floor()],
//           name: 'Reviewer $i',
//           review: "This is a reivew by Reviewer $i",
//           rating:
//               double.parse((Random().nextDouble() * 4 + 1).toStringAsFixed(1)));
//       reviews.add(review);
//     }
//   }
//
//   // getFacilities() {
//   //   for (int i = 0; i < 8; i++) {
//   //     final facility = Facility(name: facilities[i]);
//   //     fs.add(facility);
//   //   }
//   // }
//
//   getProperties() {
//     for (int i = 1; i <= 10; i++) {
//       final property = Property(
//         image: propertiesImages[
//             (propertiesImages.length * Random().nextDouble()).floor()],
//         name: 'Property $i',
//         type: propertyTypes[
//             (propertyTypes.length * Random().nextDouble()).floor()],
//         geolocation: '192.168.1.$i, 192.168.1.$i',
//         price: (9000 * Random().nextDouble()).floor() + 1000,
//         area: (3000 * Random().nextDouble()).floor() + 500,
//         bedRooms: (5 * Random().nextDouble()).floor() + 1,
//         bathRooms: (5 * Random().nextDouble()).floor() + 1,
//         rating:
//             double.parse((Random().nextDouble() * 4 + 1).toStringAsFixed(1)),
//         agent: agents[(agents.length * Random().nextDouble()).floor()],
//         description: 'This is the description for Property $i',
//         address: '123 Property street, City $i',
//       );
//
//       properties.add(property);
//     }
//   }
//
//   Future<void> insertGalleries() async {
//     // getReviews();
//     // getFacilities();
//     // getProperties();
//     try {
//       // final inserData = properties
//       //     .map((property) => property.toMap())
//       //     .toList();
//
//       final pro = await supbaseClient.from("properties").select();
//
//       final fac = await supbaseClient.from("facilities").select();
//
//       final gal = await supbaseClient.from("galleries").select();
//
//       final rev = await supbaseClient.from("reviews").select();
//       final random = Random();
//
//       for (final property in pro) {
//         final propertyId = property['id'];
//
//         // Randomly pick 1–3 facilities
//         final selectedFacilities =
//             (fac..shuffle()).take(1 + random.nextInt(8)).toList();
//         for (final facility in selectedFacilities) {
//           await supbaseClient.from('property_facility').insert({
//             'property_id': propertyId,
//             'facility_id': facility['id'],
//           });
//         }
//
//         // Randomly pick 1–2 galleries
//         final selectedGalleries =
//             (gal..shuffle()).take(1 + random.nextInt(19)).toList();
//         for (final gallery in selectedGalleries) {
//           await supbaseClient.from('property_gallery').insert({
//             'property_id': propertyId,
//             'gallery_id': gallery['id'],
//           });
//         }
//
//         // Randomly pick 1 review
//         final selectedReview = rev[random.nextInt(rev.length)];
//         await supbaseClient.from('property_review').insert({
//           'property_id': propertyId,
//           'review_id': selectedReview['id'],
//         });
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
