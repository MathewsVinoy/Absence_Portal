import 'package:app/functions/login_check.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController adnoController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: adnoController,
          ),
          TextField(
            controller: passController,
          ),
          ElevatedButton(
            onPressed: () async {
              await loginCheck(
                adnoController.text,
                passController.text,
                context,
              );
            },
            child: Text("Login Page"),
          ),
        ],
      ),
    );
  }
}
