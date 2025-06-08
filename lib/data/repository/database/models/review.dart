class Review {
  final String avatar;
  final int property;
  final String name;
  final String review;
  final double rating;

  Review(
      {required this.avatar,
      required this.property,
      required this.name,
      required this.review,
      required this.rating});

  Map<String, dynamic> toMap() {
    return {
      "avatar": avatar,
      "name": name,
      "review": review,
      "rating": rating,
    };
  }
}
