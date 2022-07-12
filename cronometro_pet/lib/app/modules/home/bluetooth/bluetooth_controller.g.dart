// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BluetoothController on _BluetoothControllerBase, Store {
  final _$isActivedAtom = Atom(name: '_BluetoothControllerBase.isActived');

  @override
  bool get isActived {
    _$isActivedAtom.reportRead();
    return super.isActived;
  }

  @override
  set isActived(bool value) {
    _$isActivedAtom.reportWrite(value, super.isActived, () {
      super.isActived = value;
    });
  }

  final _$timeAtom = Atom(name: '_BluetoothControllerBase.time');

  @override
  String get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$devicesAtom = Atom(name: '_BluetoothControllerBase.devices');

  @override
  List<BluetoothDevice> get devices {
    _$devicesAtom.reportRead();
    return super.devices;
  }

  @override
  set devices(List<BluetoothDevice> value) {
    _$devicesAtom.reportWrite(value, super.devices, () {
      super.devices = value;
    });
  }

  final _$deviceChoosedAtom =
      Atom(name: '_BluetoothControllerBase.deviceChoosed');

  @override
  BluetoothDevice? get deviceChoosed {
    _$deviceChoosedAtom.reportRead();
    return super.deviceChoosed;
  }

  @override
  set deviceChoosed(BluetoothDevice? value) {
    _$deviceChoosedAtom.reportWrite(value, super.deviceChoosed, () {
      super.deviceChoosed = value;
    });
  }

  final _$loadingAtom = Atom(name: '_BluetoothControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isConnectedAtom = Atom(name: '_BluetoothControllerBase.isConnected');

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  @override
  String toString() {
    return '''
isActived: ${isActived},
time: ${time},
devices: ${devices},
deviceChoosed: ${deviceChoosed},
loading: ${loading},
isConnected: ${isConnected}
    ''';
  }
}
