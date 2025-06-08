class Agent {
  final String avatar;
  final String name;
  final String email;
  final int id;

  Agent({required this.id, required this.avatar, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      "avatar": avatar,
      "email": email,
      "name": name,
    };
  }
}
