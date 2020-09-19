import 'package:Vacuate/Custom/arrow_tiles/direction_tile.dart';
import 'package:flutter/material.dart';

class DownwardArrowTile extends StatelessWidget {
  const DownwardArrowTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DirectionTile(
      child: Icon(
        Icons.arrow_downward,
        color: Colors.white,
        size: 70,
      ),
      size: 100,
    );
  }
}