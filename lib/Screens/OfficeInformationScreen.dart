
import 'package:Vacuate/Custom/BottomNavBar.dart';
import 'package:Vacuate/positional_tracking/device.dart';
import 'package:Vacuate/positional_tracking/sensor_handler.dart';
import 'package:Vacuate/visual/room_visual.dart';
import 'package:flutter/material.dart';
import '../Custom/camera_card.dart';
import '../Custom/page_title.dart';
import '../constants.dart';
import '../constants.dart';

class OfficeInformationScreen extends StatefulWidget {
  OfficeInformationScreen({Key key}) : super(key: key);

  _OfficeInformationScreenState createState() =>
      _OfficeInformationScreenState();
}

class _OfficeInformationScreenState extends State<OfficeInformationScreen> {
  Device device;
  SensorHandler sensorHandler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.device = Device();
    this.sensorHandler = SensorHandler(this.device);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: (this.device != null && this.sensorHandler != null) ?SafeArea(
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
                  child: CustomPaint(painter: RoomVisualPainter(sensors: this.sensorHandler.sensors, device: this.sensorHandler.approximateDevice())),
              ),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              // Camera Sensor Values List
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text("Camera Sensor Values", style: subTextStyle),
              ),
              Container( child: CameraCard(), padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container( child: CameraCard(), padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),

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
              
            ],
          ),
        ),
      ) : Text("Loading..."),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: RawMaterialButton(
          shape: CircleBorder(),
          fillColor: pinkishColor,
          child: Icon(Icons.directions_run, color: Colors.black, size: 50),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
