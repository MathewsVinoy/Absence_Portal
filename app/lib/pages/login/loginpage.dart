import 'package:app/database/login.dart';
import 'package:app/functions/google_sign.dart';
import 'package:app/pages/students/navebar_std.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: signIn,
              child: Text("Login Page"),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    final user = await GoogleSignApi.login();
    Login data = await loginCheck(user!.email);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NaveBarStd(
          data: data,
        ),
      ),
    );
  }
}
