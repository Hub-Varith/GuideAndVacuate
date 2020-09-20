
import 'package:flutter/material.dart';

import '../constants.dart';
class FOB extends StatelessWidget {
  const FOB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 75,
        width: 75,
        child: RawMaterialButton(
          shape: CircleBorder(),
          fillColor: pinkishColor,
          child: Icon(Icons.directions_run, color: Colors.black, size: 50),
          onPressed: () {
            Navigator.of(context).pushNamed("/evacuation_screen");
          },
        ),
      ),
      
    );
  }
}