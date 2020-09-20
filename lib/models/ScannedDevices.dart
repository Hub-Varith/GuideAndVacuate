import 'package:flutter_ble_lib/flutter_ble_lib.dart';

class ScannedDevices{
  String title;
  Peripheral peripheral;
  ScanResult result;
  ScannedDevices({this.title, this.peripheral, this.result});
}