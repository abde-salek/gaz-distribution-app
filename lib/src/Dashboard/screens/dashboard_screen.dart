import 'package:flutter/material.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/app_bar.dart';

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
      appBar: CustomAppBar(
        title: 'Dashboard',
        leftIcon: IconButton(
          icon: const Icon(Icons.contactless_sharp),
          onPressed: () {},
        ),
        rightIcon: null,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 141,
      ),
    );
  }
}
