import 'package:Vacuate/constants.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: SizedBox(
            child: Image.asset("assets/images/Logo.png", scale: 0.8),
          ),
        ),
        title: Text(
          title,
          style: titleTextStyle,
          maxLines: 2,
        ),
      ),
    );
  }
}
