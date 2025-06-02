class Agent {
  final String avatar;
  final String name;
  final String email;
  final int id;

  Agent(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      "avatar": avatar,
      "email": email,
      "name": name,
    };
  }

  factory Agent.fromMap(Map<String, dynamic> agent) {
    return Agent(
      id: agent['id'] as int,
      email: agent['email'] as String,
      avatar: agent['avatar'] as String,
      name: agent['name'] as String,
    );
  }

  factory Agent.empty() {
    return Agent(
      id: 0,
      email: "",
      avatar: "",
      name: "",
    );
  }
}
