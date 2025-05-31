class Gallery {
  final String image;

  Gallery({required this.image});

  Map<String, dynamic> toMap() {
    return {
      "image": image,
    };
  }
}
