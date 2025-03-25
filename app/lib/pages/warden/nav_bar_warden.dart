import 'package:app/database/login.dart';
import 'package:app/pages/warden/homepage_warden.dart';
import 'package:app/pages/warden/status_warden.dart';

import 'package:flutter/material.dart';

class NavBarWarden extends StatefulWidget {
  final Login data;
  const NavBarWarden({super.key, required this.data});

  @override
  State<NavBarWarden> createState() => _NavBarWardenState();
}

class _NavBarWardenState extends State<NavBarWarden> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      HomePageWarden(data: widget.data),
      StatusWarden(data: widget.data),
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
