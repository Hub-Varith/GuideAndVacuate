import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:Vacuate/Services/firebase_api.dart';
import 'package:Vacuate/models/appUser.dart';

class SensorProvider  {
  Future<bool> postSensorData(monoxide, temperature) async{
    var timestamp = Timestamp.now();
    await FirebaseFirestore.instance.collection("sensor1").add({
      "Timestamp": timestamp,
      "Monoxide": monoxide,
      "Temperature": temperature
    });
    return true;
  }
}

