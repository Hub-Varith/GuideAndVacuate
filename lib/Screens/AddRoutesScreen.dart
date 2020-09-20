import 'package:Vacuate/Custom/BottomNavBar.dart';
import 'package:Vacuate/Custom/fob.dart';
import 'package:flutter/material.dart';

import '../Custom/page_title.dart';
import '../constants.dart';

class AddRoutesScreen extends StatefulWidget {
  AddRoutesScreen({Key key}) : super(key: key);

  _AddRoutesScreenState createState() => _AddRoutesScreenState();
}

class _AddRoutesScreenState extends State<AddRoutesScreen> {
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
                child: Text("Add Routes", style: subTextStyle),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              Text("Add diagram map entrance here"),
              

              // Add Route Button
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.28, 0, MediaQuery.of(context).size.width * 0.28, 0),
               child: ButtonTheme(
                  height: 50,
                  
                  child: FlatButton(
                  
                  color: purpleColor,
                  onPressed: () => print("Add Building Routes"),
                  child: Text("Press To Start", style: standardWhiteTitle),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FOB(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}