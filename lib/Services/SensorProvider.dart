import 'package:cloud_firestore/cloud_firestore.dart';


class SensorProvider  {
  Future<bool> postSensorData(_sensor) async{
    var timestamp = Timestamp.now();
    await FirebaseFirestore.instance.collection("sensor1").add({
      "FIRE": _sensor.FIRE,
      "LPG": _sensor.LPG,
      "Monoxide": _sensor.Monoxide,
      "Temperature": _sensor.Temperature,
      "day of the week": _sensor.day_of_the_week,
      "timehour": _sensor.timehour,
      "timemin": _sensor.timemin,
      "timesec": _sensor.timesec,
      "uploadTimestamp": timestamp,
    });
    return true;
  }
}

