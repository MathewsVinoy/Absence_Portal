class ClassIncharge {
  String userid;
  String semester;
  String branch;

  ClassIncharge({
    required this.userid,
    required this.branch,
    required this.semester,
  });

  factory ClassIncharge.fromJson(Map<String, dynamic> json) {
    return ClassIncharge(
      userid: json['userid'] as String,
      branch: json['branch'] as String,
      semester: json['semester'] as String,
    );
  }
}
