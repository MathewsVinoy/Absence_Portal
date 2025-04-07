import 'package:app/database/login.dart';
import 'package:app/pages/staff/accepeted_staff.dart';
import 'package:app/pages/staff/homepage_staff.dart';
import 'package:app/ui/color.dart';
import 'package:flutter/material.dart';

class NavBarStaff extends StatefulWidget {
  final Login data;
  const NavBarStaff({super.key, required this.data});

  @override
  State<NavBarStaff> createState() => _NavBarStaffState();
}

class _NavBarStaffState extends State<NavBarStaff> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      HomePageStaff(data: widget.data),
      AccepetedStaff(data: widget.data),
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
        backgroundColor: white,
        selectedItemColor: mainColor,
        unselectedItemColor: primaryColor.withValues(alpha: 0.5),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
