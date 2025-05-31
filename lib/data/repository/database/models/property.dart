class Property {
  final String image;
  final String name;
  final String type;
  final String geolocation;
  final int agent;
  final String description;
  final String address;
  final double rating;
  final double area;
  final int bedRooms;
  final int bathRooms;
  final int price;

  Property(
      {required this.image,
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
}
