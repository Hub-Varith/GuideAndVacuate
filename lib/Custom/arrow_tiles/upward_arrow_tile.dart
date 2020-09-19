import 'package:Vacuate/Custom/arrow_tiles/direction_tile.dart';
import 'package:flutter/material.dart';

class UpwardArrowTile extends StatelessWidget {
  const UpwardArrowTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DirectionTile(
      child: Icon(
        Icons.arrow_upward,
        color: Colors.white,
        size: 70,
      ),
      size: 100,
    );
  }
}