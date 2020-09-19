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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
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
              Text("Insert Google Map Location here "), // TODO: GMAPS location here
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
      ),
    );
  }
}
