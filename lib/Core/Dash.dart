import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Dash Widget'),
      ),
    );
  }
}