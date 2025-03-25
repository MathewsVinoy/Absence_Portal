class Login {
  String userid;
  String email;
  String username;
  String userCategory;
  String semester;
  String branch;
  String hLevel;
  String subCategory;

  Login({
    required this.userid,
    required this.username,
    required this.email,
    required this.userCategory,
    required this.semester,
    required this.branch,
    required this.hLevel,
    required this.subCategory,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      userid: json['userid'] as String,
      username: json['user_name'] as String,
      email: json['email'] as String,
      userCategory: json['user_category'] as String,
      semester: json['semester'] as String,
      branch: json['branch'] as String,
      hLevel: json['h_level'] as String,
      subCategory: json['sub_category'] as String,
    );
  }
}
