class Facility {
  final String name;

  Facility({ required this.name});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
    };
  }
}