import 'package:flutter/material.dart';

class BottleTable extends StatefulWidget {
  const BottleTable({super.key});

  @override
  State<BottleTable> createState() => _BottleTableState();
}

class _BottleTableState extends State<BottleTable> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Text('Bottle'),
          ],
        ),
      ],
    );
  }

  /// Returns cylinder width based on size
  static double _getCylinderSize(String size) {
    switch (size) {
      case 'large':
        return 35; // 4x small
      case 'medium':
        return 26; // 2x small
      case 'small':
        return 18; // base size
      default:
        return 18;
    }
  }
}