import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:Vacuate/models/ScannedDevices.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class BtServices with ChangeNotifier {
  static List<ScannedDevices> listOfDevices = [];

  //Init
  BleManager _bleManager = BleManager();
  StreamSubscription<List<ScannedDevices>> visibleDevicesSubscription;
  PermissionStatus _locationPermissionStatus = PermissionStatus.unknown;
  StreamSubscription<ScanResult> _scanSubscription;
  StreamController<List> visibleDevicesController = StreamController.broadcast();
  Stream<List> get visibleDevices => visibleDevicesController.stream;

  //Initialize BLE
  Future<void> initializeBle() async {
    await _bleManager.createClient();
    BluetoothState currentState = await _bleManager.bluetoothState();
    _bleManager.observeBluetoothState().listen((btState) {
      if (btState == BluetoothState.POWERED_OFF) {
        _bleManager.enableRadio();
        print("BT ON");
      }
      print(btState);
      //do your BT logic, open different screen, etc.
    });
  }

  //Create ble manager
  void init() {
    listOfDevices.clear();
    _checkPermissions()
        .catchError((e) => print("Permissions check err $e"))
        .then((value) => scanPeripherals())
        .then((value) => notifyListeners());
  }

  void scanPeripherals() {
    _scanSubscription =
        _bleManager.startPeripheralScan().listen((ScanResult result) {

      Map<String, dynamic> devicesInformation = {
        "name": result.advertisementData.localName,
        "rssi": result.rssi
      };

      List devicesInfo = devicesInformation.values.toList();

      // var devicesInfo = devicesInformation.values.toList();
      visibleDevicesController.add(devicesInfo);
      print("adData: ${result.advertisementData}\n rssi: ${result.rssi}");
      notifyListeners();
    });
  }

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
