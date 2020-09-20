import 'dart:async';
import 'dart:io';

import 'package:Vacuate/Custom/highlightedText.dart';
import 'package:Vacuate/Custom/page_title.dart';
import 'package:Vacuate/Services/SensorProvider.dart';
import 'package:Vacuate/Services/TTSService.dart';
import 'package:Vacuate/models/sensorData.dart';
import 'package:Vacuate/positional_tracking/device.dart';
import 'package:Vacuate/positional_tracking/room.dart';
import 'package:Vacuate/positional_tracking/sensor_handler.dart';
import 'package:Vacuate/visual/room_visual.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:Vacuate/constants.dart';
import 'package:provider/provider.dart';
import 'package:Vacuate/Services/BleService.dart';

class EvacuationScreen extends StatefulWidget {
  @override
  _EvacuationScreenState createState() => _EvacuationScreenState();
}

class _EvacuationScreenState extends State<EvacuationScreen> {
  var device;
  var sensorHandler;
  var room;
  TTSService tts;

  SensorData _sensor;
  DatabaseReference _sensorRef;
  StreamSubscription<Event> _sensorSubscription;
  DatabaseError _error;
  SensorProvider sensorProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.device = Device();
    this.sensorHandler = SensorHandler(this.device);
    this.room = Room();

    sensorProvider = SensorProvider();
    
    this._sensorRef = FirebaseDatabase.instance.reference().child("SensorData");
    _sensorRef.keepSynced(true);
    _sensorSubscription = _sensorRef.onValue.listen((Event e) {
      setState((){
        _error = null;
        _sensor = SensorData.fromJson(e.snapshot.value) ?? "";
        sensorProvider.postSensorData(_sensor);
      });
    }, onError: (Object o) {
      final DatabaseError error = o;
      setState(() {
        _error = error; 
      });
    });

    tts = TTSService();
    tts.getTTS("Please proceed to the nearest exit, highlighted on the map!").then((_) async =>{
      if(_sensor.Monoxide > 4){
        await tts.getTTS("Carbon Monoxide is present in high quantities. Be aware of your breathing!"),
      },
      if(_sensor.LPG > 3){
        await tts.getTTS("Gas is present large quantities. Be aware of the possibility of an explosion."),
      },
      if(_sensor.FIRE == true){
        await tts.getTTS("Fire is PRESENT. I repeat, Fire is present!")
      }
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sensorSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var bleService = Provider.of<BtServices>(context);
    // var roomPainter = Provider.of<RoomVisualPainter>(context);
    return Scaffold(
      backgroundColor: bgColor,
      body:  (this._sensor != null) ? SafeArea(
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
              Container(
                width: 300,
                height: 300,
                margin: EdgeInsets.fromLTRB(00, 0, 0, 0),
                child: CustomPaint(
                  painter: RoomVisualPainter(
                    sensors: this.sensorHandler.sensors,
                    device: this.sensorHandler.approximateDevice(),
                    room: this.room,
                    bleService: bleService,
                  ),
                ),
              ),
              SizedBox(height: 20),
              StreamBuilder<List>(
                stream: bleService.visibleDevices,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Finding Location...", style: subTextStyle);
                  }
                  return Text(
                    "rssi = ${snapshot.data[1].toString()}\nname = ${snapshot.data[0].toString()} ",
                    style: normalTextStyle,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: HighlightedText(text: "Locate"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        bleService.stopPeripheralScan();
                      },
                      child: HighlightedText(text: "Stop Device Scan"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ) : Text("Loading..."),
    );
  }
}
