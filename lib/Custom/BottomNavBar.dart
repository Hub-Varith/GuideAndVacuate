import 'package:Vacuate/Services/UserAuthProvider.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var _userAuth = Provider.of<UserAuthProvider>(context);
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
              onTap: () => Navigator.of(context).pushNamed("/home_screen"),
              child: Icon(
                Icons.home,
                size: 60,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName("/"));
                _userAuth.signOut();
              },
              child: Icon(
                Icons.person_outline,
                size: 60,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
