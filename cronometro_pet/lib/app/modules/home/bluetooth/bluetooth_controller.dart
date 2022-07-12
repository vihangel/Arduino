import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'bluetooth_controller.g.dart';

class BluetoothController = _BluetoothControllerBase with _$BluetoothController;

abstract class _BluetoothControllerBase with Store {
  @observable
  bool isActived = false;

  @observable
  String time = "00:00:00";

  FlutterBlue flutterBlue = FlutterBlue.instance;

  @observable
  List<BluetoothDevice> devices = ObservableList();

  @observable
  BluetoothDevice? deviceChoosed;

  @observable
  bool loading = false;

  void searchDevices() {
    loading = true;
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      devices.clear();
      Future.delayed(Duration(seconds: 4), () {
        flutterBlue.stopScan();
        loading = false;
      });
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        devices.add(r.device);
      }
    });
  }

  Future<void> connectDevice() async {
    // Disconnect from device
    deviceChoosed!.disconnect();
    // Connect to the device
    await deviceChoosed!.connect();
  }
}
