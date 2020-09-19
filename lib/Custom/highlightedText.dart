import 'package:flutter/material.dart';
import '../constants.dart';

class HighlightedText extends StatelessWidget {
  final String text;

  const HighlightedText({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3,),
        child: Text(
          text,
          style: normalTextStyle,
        ),
      ),
      decoration: BoxDecoration(
        color: purpleColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
