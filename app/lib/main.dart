import 'package:app/database/login.dart';
import 'package:app/pages/security/nav_bar_sec.dart';

import 'package:app/ui/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Login data = Login(
      // userid: '5736',
      // username: 'Mathews Vinoy',
      // email: '5736@mbcpeermade.com',
      // userCategory: 'Student',
      // semester: 'S6',
      // branch: "AI",
      // hLevel: '0',
      // subCategory: 'BTech',
      // userid: 'CS1050',
      // username: 'Jeena Mary Kurian',
      // email: 'cs1050@mbcpeermade.com',
      // userCategory: 'Staff',
      // semester: 'Assistant Professor',
      // branch: "AI",
      // hLevel: '3',
      // subCategory: 'Teaching',
      userid: 'HO3016',
      username: 'Thomas M.T',
      email: 'ho3016@mbcpeermade.com',
      userCategory: 'Staff',
      semester: 'Assistant Warden',
      branch: "HO",
      hLevel: '1',
      subCategory: 'Non-teaching',
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: NavBarSec(data: data),
    );
  }
}


// student-sample details
// Login(
//       userid: '5747',
//       username: 'Mathews Vinoy',
//       email: '5736@mbcpeermade.com',
//       userCategory: 'Student',
//       semester: 'S6',
//       branch: "CS",
//       hLevel: '0',
//       subCategory: 'BTech',
//     );