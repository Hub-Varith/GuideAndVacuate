import 'package:Vacuate/Custom/page_title.dart';
import 'package:Vacuate/positional_tracking/room.dart';
import 'package:Vacuate/positional_tracking/sensor_handler.dart';
import 'package:flutter/material.dart';
import 'package:Vacuate/constants.dart';
import 'package:Vacuate/visual/room_visual.dart';
import 'package:provider/provider.dart';
import 'package:Vacuate/positional_tracking/device.dart';

class EvacuationScreen extends StatefulWidget {
  @override
  _EvacuationScreenState createState() => _EvacuationScreenState();
}

class _EvacuationScreenState extends State<EvacuationScreen> {
  SensorHandler sensorHandler;
  Device device;
  Room room;
  @override
  Widget build(BuildContext context) {
    // var roomPainter = Provider.of<RoomVisualPainter>(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              PageTitle(title: "Vacuate"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text("Evacuate", style: subTextStyle),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
