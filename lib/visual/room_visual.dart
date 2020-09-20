import 'package:Vacuate/constants.dart';
import 'package:Vacuate/positional_tracking/room.dart';
import 'package:Vacuate/positional_tracking/sensor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Vacuate/Services/BleService.dart';

class RoomVisualPainter extends CustomPainter {
  BtServices bleService;
  RoomVisualPainter({this.sensors, this.device, this.room, this.bleService});

  List<Sensor> sensors;
  var device;
  Room room;


  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.black;

    // draw boundaries of rooms
    for (int i = 0; i < sensors.length; i++) {
      canvas.drawRect(
        Rect.fromPoints(Offset(sensors[i].x, sensors[i].y), Offset(150, 150)),
        paint,
      );
    }

    // draw each sensor
    paint..color = Colors.yellow;
    for (int i = 0; i < sensors.length; i++) {
      canvas.drawCircle(Offset(sensors[i].x, sensors[i].y), 2, paint);
    }

    // Draw the Device
    paint..color = Colors.blue;
    canvas.drawCircle(Offset(device[0], device[1]), 5, paint);

    // Doorways
    paint..color = Colors.green;
    for (var doorway in room.doorWays) {
      canvas.drawRect(
          Rect.fromLTWH(doorway[0], doorway[1], doorway[2], doorway[3]), paint);
    }

    paint..color = Colors.white;
    for (var intDoor in room.intermediateDoors) {
      canvas.drawRect(
          Rect.fromLTWH(intDoor[0], intDoor[1], intDoor[2], intDoor[3]), paint);
    }

    // Pick optimal route of exit
    var spots = room.findPath(sensors, device);
    paint..color = Colors.pink;
    var old = device;
    for (int i = 0; i < spots.length; i++) {
      canvas.drawLine(
          Offset(old[0], old[1]), Offset(spots[i][0], spots[i][1]), paint);
      old = [spots[i][0], spots[i][1]];
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
