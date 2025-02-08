import 'package:app/database/login.dart';
import 'package:app/pages/students/homepage_std.dart';
import 'package:app/pages/students/status_std.dart';
import 'package:flutter/material.dart';

class NaveBarStd extends StatefulWidget {
  final Login data;
  const NaveBarStd({super.key, required this.data});

  @override
  State<NaveBarStd> createState() => _NaveBarStdState();
}

class _NaveBarStdState extends State<NaveBarStd> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    StatusStd(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Status',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
