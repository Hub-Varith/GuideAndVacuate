import 'package:Vacuate/Screens/EvacuationScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Vacuate/Services/BleService.dart';
import 'package:Vacuate/Screens/EvacuationRouteScreen.dart';

import '../constants.dart';

class FOB extends StatelessWidget {
  const FOB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bleService = Provider.of<BtServices>(context);
    return Container(
      child: Container(
        height: 75,
        width: 75,
        child: RawMaterialButton(
          shape: CircleBorder(),
          fillColor: pinkishColor,
          child: Icon(Icons.directions_run, color: Colors.black, size: 50),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EvacuationRouteScreen(bleService: bleService,),
              ),
            );
          },
        ),
      ),
    );
  }
}
