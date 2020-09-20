import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:Vacuate/models/ScannedDevices.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';

class BtServices with ChangeNotifier {
  static List<ScannedDevices> listOfDevices = [];

  //Init
  BleManager _bleManager = BleManager();
  StreamSubscription<List<ScannedDevices>> visibleDevicesSubscription;
  PermissionStatus _locationPermissionStatus = PermissionStatus.unknown;
  StreamSubscription<ScanResult> _scanSubscription;
  StreamController<List> visibleDevicesController =
      StreamController.broadcast();
  StreamController<List> visibleDevicesController2 =
      StreamController.broadcast();
  StreamController<List> visibleDevicesController3 =
      StreamController.broadcast();
  Stream<List> get visibleDevices => visibleDevicesController.stream;
  Stream<List> get visibleDevices2 => visibleDevicesController2.stream;
  Stream<List> get visibleDevices3 => visibleDevicesController3.stream;

  //Initialize BLE
  Future<void> initializeBle() async {
    await _bleManager.createClient();
    BluetoothState currentState = await _bleManager.bluetoothState();
    _bleManager.observeBluetoothState().listen((btState) {
      if (btState == BluetoothState.POWERED_OFF) {
        _bleManager.enableRadio();
      }

      //do your BT logic, open different screen, etc.
    });
  }

  //Create ble manager
  void init() {
    listOfDevices.clear();
    _checkPermissions()
        .catchError((e) => print("Permissions check err $e"))
        .then((value) => scanPeripherals1())
        // .then(
        //   (value) => scanPeripherals2(),
        // )
        // .then(
        //   (value) => scanPeripherals3(),
        // )
        .then((value) => notifyListeners());
  }

  double normalizeRssiValue(ScanResult result) {
    int absRssiVal = result.rssi.abs();
    double eq1 = (absRssiVal - 100) / 100;
    double absEq1Val = eq1.abs();
    double outputVal = absEq1Val * 300;
    return outputVal;
  }

  calculatePhoneLocation(x1, y1, r1, x2, y2, r2, x3, y3, r3) {
    r1 = normalizeRssiValue(r1);
    r2 = normalizeRssiValue(r2);
    r3 = normalizeRssiValue(r3);
    double a = 2 * x2 - 2 * x1;
    double b = 2 * y2 - 2 * y1;
    double c = r1 ^ 2 - r2 ^ 2 - x1 ^ 2 + x2 ^ 2 - y1 ^ 2 + y2 ^ 2;
    double d = 2 * x3 - 2 * x2;
    double e = 2 * y3 - 2 * y2;
    double f = r2 ^ 2 - r3 ^ 2 - x2 ^ 2 + x3 ^ 2 - y2 ^ 2 + y3 ^ 2;
    double x = (c * e - f * b) / (e * a - b * d);
    double y = (c * d - a * f) / (b * d - a * e);
    List coordinates = [x, y];
    return coordinates;
  }

  void scanPeripherals1() {
    _scanSubscription = _bleManager.startPeripheralScan(
        uuids: ["0000feed-0000-1000-8000-00805f9b34fb", "cbbfe0e1-f7f3-4206-84e0-84cbb3d09dfc"]).listen(
      (ScanResult result) {
        if (result.peripheral.identifier == "C2:BC:40:D7:70:68") {
          Map<String, dynamic> devicesInformation = {
            "name": result.peripheral.name,
            "rssi": result.rssi,
          };
          List devicesInfo = devicesInformation.values.toList();
          print(result.peripheral);
          visibleDevicesController.add(devicesInfo);
          notifyListeners();
        } else if (result.peripheral.identifier == "EA:B2:4D:8C:6E:12") {
          Map<String, dynamic> devicesInformation2 = {
            "name": result.peripheral.name,
            "rssi": result.rssi,
          };
          List devicesInfo = devicesInformation2.values.toList();
          print(result.peripheral);
          visibleDevicesController2.add(devicesInfo);
          notifyListeners();
        } else if (result.peripheral.identifier == "C8:28:32:E1:52:63") {
          Map<String, dynamic> devicesInformation3 = {
            "name": result.peripheral.name,
            "rssi": result.rssi,
          };
          List devicesInfo = devicesInformation3.values.toList();
          print(result.peripheral);
          visibleDevicesController3.add(devicesInfo);
          notifyListeners();
        }
      },
    );
  }

  // void scanPeripherals2() {
  //   _scanSubscription =
  //       _bleManager.startPeripheralScan().listen((ScanResult result) {
  //     Map<String, dynamic> devicesInformation = {
  //       "name": result.peripheral.name,
  //       "rssi": result.rssi
  //     };

  //     List devicesInfo = devicesInformation.values.toList();
  //     print(result.peripheral);
  //     // var devicesInfo = devicesInformation.values.toList();
  //     // calculatePhoneLocation(0,0,result.rssi, 300, 0,result.rssi, );
  //     visibleDevicesController2.add(devicesInfo);
  //     // print("adData: ${result.advertisementData}\n rssi: ${result.rssi}");
  //     notifyListeners();
  //   });
  // }

  // void scanPeripherals3() {
  //   _scanSubscription =
  //       _bleManager.startPeripheralScan().listen((ScanResult result) {
  //     Map<String, dynamic> devicesInformation = {
  //       "name": result.peripheral.name,
  //       "rssi": result.rssi
  //     };

  //     List devicesInfo = devicesInformation.values.toList();
  //     print(result.peripheral);
  //     // var devicesInfo = devicesInformation.values.toList();
  //     // calculatePhoneLocation(0,0,result.rssi, 300, 0,result.rssi, );
  //     visibleDevicesController3.add(devicesInfo);
  //     // print("adData: ${result.advertisementData}\n rssi: ${result.rssi}");
  //     notifyListeners();
  //   });
  // }

  void stopPeripheralScan() {
    _bleManager.stopPeripheralScan();
  }

  // void _addScannedDevices(title, Peripheral peripheral,
  //     List<ScannedDevices> listOfDevices, ScanResult result) {
  //   // final addDevList = ScannedDevices(title: title, peripheral: peripheral, result: result);

  //   // listOfDevices.add(devicesInformation);

  // }

  Future<void> _checkPermissions() async {
    if (Platform.isAndroid) {
      var permissionStatus = await PermissionHandler()
          .requestPermissions([PermissionGroup.location]);

      _locationPermissionStatus = permissionStatus[PermissionGroup.location];

      if (_locationPermissionStatus != PermissionStatus.granted) {
        return Future.error(
          Exception("LocationPermission not granted"),
        );
      }
    }
  }
}
