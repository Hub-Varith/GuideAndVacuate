import 'package:Vacuate/Custom/arrow_tiles/direction_tile.dart';
import 'package:flutter/material.dart';

class RightwardArrowTile extends StatelessWidget {
  const RightwardArrowTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DirectionTile(
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 70,
      ),
      size: 100,
    );
  }
}