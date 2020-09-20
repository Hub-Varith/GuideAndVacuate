import 'package:Vacuate/Screens/EvacuationScreen.dart';
import 'package:Vacuate/Services/BleService.dart';
import 'package:flutter/material.dart';
import 'package:Vacuate/constants.dart';
import 'package:Vacuate/Custom/page_title.dart';
import 'package:provider/provider.dart';
import 'package:Vacuate/Services/BleService.dart';

import '../constants.dart';

class EvacuationRouteScreen extends StatefulWidget {
  final BtServices bleService;

  EvacuationRouteScreen({this.bleService});

  @override
  _EvacuationRouteState createState() => _EvacuationRouteState();
}

class _EvacuationRouteState extends State<EvacuationRouteScreen> {
  @override
  void initState() {
    super.initState();
    widget.bleService.initializeBle().then((value) => widget.bleService.init());
  }


  Widget evacuationLoadingScreen() {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                PageTitle(
                  title: "Vacuate",
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text("Evacuate", style: subTextStyle),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    child: Image.asset(
                      "assets/images/fire.png",
                      height: MediaQuery.of(context).size.height * .25,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Finding Your",
                  style: pinkAnnouncement,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text("Best Evacuation Route...", style: pinkAnnouncement)
              ],
            )),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: widget.bleService.visibleDevices, builder: (context, snapshot) {
      if(!snapshot.hasData) {
        return evacuationLoadingScreen();
      }
      return EvacuationScreen();
    });
  }
}
