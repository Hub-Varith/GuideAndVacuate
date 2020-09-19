import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomVisualPainter extends CustomPainter {
  RoomVisualPainter({this.sensors, this.device});
  var sensors;
  var device;
  @override
  void paint(Canvas canvas, Size size){
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.black;
    for(int i = 0; i < sensors.length; i++){
      canvas.drawRect(
        Rect.fromPoints(Offset(sensors[i][0], sensors[i][1]), Offset(150, 150)),
        paint,
      );
    }

    paint ..color = Colors.yellow;
    for(int i = 0; i < sensors.length; i++){
      canvas.drawCircle(Offset(sensors[i][0], sensors[i][1]), 2, paint);
    }

    paint ..color = Colors.red;
    canvas.drawCircle(Offset(device.x, device.y), 5, paint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}