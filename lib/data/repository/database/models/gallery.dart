class Gallery {
  final String image;
  final int property;

  Gallery({required this.image, required this.property});

  Map<String, dynamic> toMap() {
    return {
      "image": image,
    };
  }
}
