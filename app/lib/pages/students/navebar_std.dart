import 'package:app/database/login.dart';
import 'package:app/pages/students/homepage_std.dart';
import 'package:app/pages/students/status_std.dart';
import 'package:flutter/material.dart';

class NavBarStd extends StatefulWidget {
  final Login data;
  const NavBarStd({super.key, required this.data});

  @override
  State<NavBarStd> createState() => _NavBarStdState();
}

class _NavBarStdState extends State<NavBarStd> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      StatusStd(data: widget.data),
      HomePage(data: widget.data),
    ];
  }

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
