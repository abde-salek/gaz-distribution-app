import 'package:flutter/material.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('You are on page $_selectedIndex')),
      bottomNavigationBar: AppNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
