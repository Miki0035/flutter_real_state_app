class ApartmentModel {
  final String image;
  final String apartmentName;
  final String location;
  final double rating;
  final int price;
  final int id;
  final Type type;

  ApartmentModel({
    required this.id,
    required this.image,
    required this.apartmentName,
    required this.location,
    required this.rating,
    required this.price,
    required this.type,
  });
}

enum Type {
  house,
  villa,
  apartments,
  all,
  others,
}
