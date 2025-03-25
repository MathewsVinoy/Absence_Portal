import 'package:app/database/login.dart';
import 'package:app/pages/hod/homepage_hod.dart';
import 'package:app/pages/hod/status_hod.dart';
import 'package:flutter/material.dart';

class NavBarHod extends StatefulWidget {
  final Login data;
  const NavBarHod({super.key, required this.data});

  @override
  State<NavBarHod> createState() => _NavBarHodState();
}

class _NavBarHodState extends State<NavBarHod> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      HomePageHod(data: widget.data),
      StatusHod(data: widget.data),
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
