import 'dart:math';

import 'device.dart';
import 'sensor_handler.dart';

class Simulator {
  getRs(Device device, SensorHandler sensorHandler) {
    for(int i = 0; i < sensorHandler.sensors.length; i++){
      sensorHandler.sensors[i][2] = _distanceFormula(device.x, sensorHandler.sensors[i][0], device.y, sensorHandler.sensors[i][1]);
    }
  }

  double _distanceFormula(x1, x2, y1, y2){
    return (sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2));
  }
}