import 'package:Vacuate/constants.dart';
import 'package:flutter/material.dart';

class DirectionTile extends StatelessWidget {
  final Icon icon;
  final double size;
  const DirectionTile({Key key, this.icon, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.06),            
            blurRadius: 18,
            spreadRadius: 1,
            offset: Offset(2, 6)
          ),
        ],
      ),
      
      height: size,
      width: size,
      child: icon,
    );
  }
}

// Icon(
//   Icons.arrow_back = LEFT, // arrow_downward = DOWNWARD/REVERSE // arrow_upward = UPWARD // arrow_forward= RIGHTWARD
//   color: Colors.white,
//   size: 70,
// ),
