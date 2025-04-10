import 'package:app/database/login.dart';
import 'package:app/pages/students/homepage_std.dart';
import 'package:app/pages/students/status_std.dart';
import 'package:app/ui/color.dart';
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
      HomepageStd(data: widget.data),
      StatusStd(data: widget.data),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Status',
          ),
        ],
      ),
    );
  }
}
