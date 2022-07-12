import 'dart:async';

import 'package:asuka/asuka.dart';
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

  @observable
  bool isConnected = false;

  void searchDevices() {
    loading = true;
    deviceChoosed!.disconnect();
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

  Future<void> connectDevice(BluetoothDevice device) async {
    // Disconnect from device
    // deviceChoosed!.disconnect();
    // Connect to the device
    deviceChoosed = device;
    try {
      await deviceChoosed!.connect();
      AsukaSnackbar.success('Conectado com sucesso!');
      isConnected = true;
      listener();
    } on Exception catch (e) {
      print("Bletooth error to connect: $e");
    }
  }

  Future<void> listener() async {
    List<BluetoothService> services = await deviceChoosed!.discoverServices();
    services.forEach((service) async {
      // do something with service]
      var characteristics = service.characteristics;
      for (BluetoothCharacteristic c in characteristics) {
        List<int> value = await c.read();
        print(value);
        await c.setNotifyValue(true);
        c.value.listen((value) {
          print(value);
          // do something with new value
        });
      }
    });
    // Reads all characteristics
  }
}
