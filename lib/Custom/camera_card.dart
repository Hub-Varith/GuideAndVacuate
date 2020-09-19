import '../constants.dart';

import "custom_card.dart";
import 'package:flutter/material.dart';

class CameraCard extends StatelessWidget {
  const CameraCard({Key key}) : super(key: key);

  final int heat = 40;
  final int roomTemp = 25;
  final bool fire = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomCard(
        height:MediaQuery.of(context).size.height * 0.28,
        
        child: 
        Container(
          padding: EdgeInsets.all(5),
          child: Row(children: <Widget>[
            Container(
              width: 150,
              child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/images/cctv-camera.png", width: 120, height:120)
                ),

                Text("Camera 2", style: standardWhiteTitle),
                Text("Online", style: smallGreen)
            ],),
            ),
            
            VerticalDivider(width: 5, color: Colors.black),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[
                  Text("Heat:   ", style: standardWhiteDetail,),
                  Text(heat.toString() + " degrees", style: standardPurpleDetail)
                ],),
                SizedBox(height: 15,),
                Text("Room Temperature:   ", style: standardWhiteDetail,),
                Text(roomTemp.toString() + " degrees", style: standardPurpleDetail),
                SizedBox(height: 15,),
                Row(children: <Widget>[
                  Text("Fire:   ", style: standardWhiteDetail,),
                  fire ? Text("True", style: standardPurpleDetail) : Text("False", style: standardPurpleDetail)
                ],)
              ],)
          ],),
        )
      ),
    );
  }
}