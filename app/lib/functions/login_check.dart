import 'package:app/database/login.dart';
import 'package:app/database/server.dart';
import 'package:app/pages/homepage.dart';
import 'package:flutter/material.dart';

Future loginCheck(
    String username, String passward, BuildContext context) async {
  String queary = "SELECT * FROM student WHERE username = $username";
  List<Login> data = await Server.getLoginTable(queary);
  if (data.isNotEmpty) {
    Login user = data[0];
    if (user.passward == passward) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      );
    }
  }
}
