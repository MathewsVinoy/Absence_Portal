import 'package:app/database/login.dart';
import 'package:app/pages/security/incheck_sec.dart';
import 'package:app/pages/security/outcheck_sec.dart';
import 'package:app/pages/security/status_sec.dart';
import 'package:app/ui/color.dart';
import 'package:flutter/material.dart';

class NavBarSec extends StatefulWidget {
  final Login data;
  const NavBarSec({super.key, required this.data});

  @override
  State<NavBarSec> createState() => _NavBarSecState();
}

class _NavBarSecState extends State<NavBarSec> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      OutcheckSec(data: widget.data),
      IncheckSec(data: widget.data),
      StatusSec(data: widget.data),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.output_rounded),
            label: 'Out Check',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input_rounded),
            label: 'In Check',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Status',
          ),
        ],
      ),
    );
  }
}
