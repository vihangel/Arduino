import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_scan_model.g.dart';

@JsonSerializable()
class BluetoothScanModel {
  // @HiveField(0)

  String? twitter;

  String? facebook;

  String? instagram;

  String? whatsapp;

  BluetoothScanModel(
      {this.twitter, this.facebook, this.instagram, this.whatsapp});

  factory BluetoothScanModel.fromJson(Map<String, dynamic> json) =>
      _$BluetoothScanModelFromJson(json);
  Map<String, dynamic> toJson() => _$BluetoothScanModelToJson(this);
}
