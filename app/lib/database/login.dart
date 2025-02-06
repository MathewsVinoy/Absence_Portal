class Login {
  String id;
  String username;
  String passward;

  Login({required this.id, required this.username, required this.passward});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json['id'] as String,
      username: json['username'] as String,
      passward: json['passward'] as String,
    );
  }
}
