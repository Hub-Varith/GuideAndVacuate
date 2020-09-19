import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomVisualPainter extends CustomPainter {
  RoomVisualPainter({this.sensors, this.device});

  var doorWays = [
    [75.0, 300.0, 25.0, 1.0],
    [175.0, 0.0, 25.0, 1.0]
  ];

  var intermediateDoors = [
    [50.0, 150.0, 25.0, 1.0],
    [200.0, 150.0, 25.0, 1.0],
    [150.0, 50.0, 1.0, 25.0],
    [150.0, 200.0, 1.0, 25.0],
  ];
  var sensors;
  var device;
  @override
  void paint(Canvas canvas, Size size){
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.black;
    
    // draw boundaries of rooms
    for(int i = 0; i < sensors.length; i++){
      canvas.drawRect(
        Rect.fromPoints(Offset(sensors[i].x, sensors[i].y), Offset(150, 150)),
        paint,
      );
    }

    // draw each sensor
    paint ..color = Colors.yellow;
    for(int i = 0; i < sensors.length; i++){
      canvas.drawCircle(Offset(sensors[i].x, sensors[i].y), 2, paint);
    }

    // Draw the Device
    paint ..color = Colors.blue;
    canvas.drawCircle(Offset(device[0], device[1]), 5, paint);
    
    // Doorways
    paint ..color = Colors.green;
    for(var doorway in doorWays){
      canvas.drawRect(
        Rect.fromLTWH(doorway[0], doorway[1], doorway[2], doorway[3]),
        paint
      );
    }

    paint ..color = Colors.white;
    for(var intDoor in intermediateDoors){
      canvas.drawRect(
        Rect.fromLTWH(intDoor[0], intDoor[1], intDoor[2], intDoor[3]),
        paint
      );
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}