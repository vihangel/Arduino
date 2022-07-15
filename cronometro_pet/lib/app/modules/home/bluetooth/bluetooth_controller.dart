import 'dart:async';

import 'package:asuka/asuka.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future<void> searchDevices() async {
    loading = true;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.location,
    ].request();
    print("Esta conectado: ${await flutterBlue.isOn}");
    final bool aux = await flutterBlue.isOn;
    if (!aux) {
      deviceChoosed == null ? null : deviceChoosed!.disconnect();
      // Start scanning
      flutterBlue.startScan();

      flutterBlue.scanResults.listen((results) {
        // do something with scan results
        devices.clear();
        Future.delayed(Duration(seconds: 20), () {
          flutterBlue.stopScan();
          loading = false;
        });
        for (ScanResult r in results) {
          print('${r.device.name} found! rssi: ${r.rssi}');
          devices.add(r.device);
        }
      });
    } else {
      print("Bluetooth is On");

      final device = await flutterBlue.connectedDevices;
      deviceChoosed = device.first;
      listener();
    }
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
    deviceChoosed!.state.listen((state) {
      AsukaSnackbar.success("Conectado com sucesso!");
      if (state == BluetoothDeviceState.connected) {
        print('Connected to device');
        onData() {
          print('Data received');
          AsukaSnackbar.success("state: $state LISTENER: ${listener()}");
        }

        listener();

        AsukaSnackbar.success("state: $state LISTENER: ${listener()}");
      }
    });
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
