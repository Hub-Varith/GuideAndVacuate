import 'package:Vacuate/positional_tracking/room.dart';
import 'package:Vacuate/positional_tracking/sensor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomVisualPainter extends CustomPainter {
  RoomVisualPainter({this.sensors, this.device, this.room});

  
  List<Sensor> sensors;
  var device;
  Room room;
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
    for(var doorway in room.doorWays){
      canvas.drawRect(
        Rect.fromLTWH(doorway[0], doorway[1], doorway[2], doorway[3]),
        paint
      );
    }

    paint ..color = Colors.white;
    for(var intDoor in room.intermediateDoors){
      canvas.drawRect(
        Rect.fromLTWH(intDoor[0], intDoor[1], intDoor[2], intDoor[3]),
        paint
      );
    }

    // Pick optimal route of exit
    var spots = room.findPath(sensors, device);
    print(spots);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}