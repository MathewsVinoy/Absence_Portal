class OutPass {
  String id;
  String name;
  String admno;

  OutPass({required this.id, required this.name, required this.admno});

  factory OutPass.fromJson(Map<String, dynamic> json) {
    return OutPass(
      id: json['id'] as String,
      name: json['name'] as String,
      admno: json['admno'] as String,
    );
  }
}
