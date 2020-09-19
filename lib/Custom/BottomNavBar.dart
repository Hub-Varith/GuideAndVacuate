import 'package:flutter/material.dart';
import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: cardColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed("/"),
              child: Icon(
                Icons.home,
                size: 60,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.person_outline,
              size: 60,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
