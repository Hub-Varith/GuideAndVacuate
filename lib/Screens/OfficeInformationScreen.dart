
import 'dart:async';

import 'package:Vacuate/Custom/BottomNavBar.dart';
import 'package:Vacuate/Custom/fob.dart';
import 'package:Vacuate/positional_tracking/device.dart';
import 'package:Vacuate/positional_tracking/room.dart';
import 'package:Vacuate/positional_tracking/sensor_handler.dart';
import 'package:Vacuate/visual/room_visual.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Custom/camera_card.dart';
import '../Custom/page_title.dart';
import '../constants.dart';
import '../models/sensorData.dart';
import 'dart:convert';

class OfficeInformationScreen extends StatefulWidget {
  OfficeInformationScreen({Key key}) : super(key: key);

  _OfficeInformationScreenState createState() =>
      _OfficeInformationScreenState();
}

class _OfficeInformationScreenState extends State<OfficeInformationScreen> {
  Device device;
  SensorHandler sensorHandler;
  Room room;
  bool loading = true;
  FirebaseApp app;
  
  SensorData _sensor;
  DatabaseReference _sensorRef;
  StreamSubscription<Event> _sensorSubscription;
  DatabaseError _error;

  @override
  void initState() {
    super.initState();
    this.device = Device();
    this.sensorHandler = SensorHandler(this.device);
    this.room = Room();

    Firebase.initializeApp(
      name: 'db1',
      options: FirebaseOptions(
              appId: '1:455185418375:web:b244dc03c4ab7440ed1022',
              apiKey: 'AIzaSyCOJbAKgkCEvTjHqUnEH4Oyt1NGqkiMLNQ',
              messagingSenderId: '455185418375',
              projectId: 'hackmit-df9ea',
              databaseURL: 'https://hackmit-df9ea.firebaseio.com',
            ),
    ).then((_app){
      app = _app;
      this.loading = false;
      this._sensorRef = FirebaseDatabase.instance.reference().child("SensorData");
      _sensorRef.keepSynced(true);
      _sensorSubscription = _sensorRef.onValue.listen((Event e) {
        setState((){
          _error = null;
          _sensor = SensorData.fromJson(e.snapshot.value) ?? "";
          print(_sensor);
        });
      }, onError: (Object o) {
        final DatabaseError error = o;
        setState(() {
         _error = error; 
        });
      });

    });
  }

  @override
  void dispose() {
    super.dispose();
    _sensorSubscription.cancel();
    app.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: (this.device != null && this.sensorHandler != null && !this.loading ) ?SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            
            children: <Widget>[
              PageTitle(
                title: "Vacuate",
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text("Office", style: subTextStyle),
              ),
              
              
              Container(
                  width: 300,
                  height: 300,
                  margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: CustomPaint(painter: RoomVisualPainter(sensors: this.sensorHandler.sensors, device: this.sensorHandler.approximateDevice(), room: this.room)),
              ),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              // Camera Sensor Values List
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text("Camera Sensor Values", style: subTextStyle),
              ),
              Container( child: CameraCard(cameraName: "Camera 1", monoxide: _sensor.monoxide, roomTemp: _sensor.temperature,), padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container( child: CameraCard(cameraName: "Camera 1", monoxide: _sensor.monoxide, roomTemp: _sensor.temperature), padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),

              // Add Route Button
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
               child: ButtonTheme(
                  height: 50,
                  child: FlatButton(
                  
                  color: cardColor,
                  onPressed: () => print("Add Building Routes"),
                  child: Text("ADD BUILDING ROUTES", style: redTextStyle),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0), 
                    
                ),
                ),
              ), 
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08,)
              
            ],
          ),
        ),
      ) : Text("Loading..."),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FOB(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
