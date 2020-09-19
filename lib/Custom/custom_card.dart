import 'package:Vacuate/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double height;
  const CustomCard({Key key, this.child, this.height}) : super(key: key);

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
      width: MediaQuery.of(context).size.width * 0.92,
      height: height,
      child: child,
    );
  }
}
