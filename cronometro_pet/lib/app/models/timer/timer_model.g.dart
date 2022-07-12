// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerModelAdapter extends TypeAdapter<TimerModel> {
  @override
  final int typeId = 1;

  @override
  TimerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimerModel(
      userId: fields[0] as String?,
    )
      ..userName = fields[1] as String?
      ..timeText = fields[2] as String?
      ..timeNumb = fields[3] as int?
      ..competitionId = fields[4] as String?
      ..competitionName = fields[5] as String?
      ..p2 = fields[6] as bool?
      ..dnf = fields[7] as bool?;
  }

  @override
  void write(BinaryWriter writer, TimerModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.timeText)
      ..writeByte(3)
      ..write(obj.timeNumb)
      ..writeByte(4)
      ..write(obj.competitionId)
      ..writeByte(5)
      ..write(obj.competitionName)
      ..writeByte(6)
      ..write(obj.p2)
      ..writeByte(7)
      ..write(obj.dnf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimerModel _$TimerModelFromJson(Map<String, dynamic> json) => TimerModel(
      userId: json['user_id'] as String?,
    )
      ..userName = json['userName'] as String?
      ..timeText = json['time_text'] as String?
      ..timeNumb = json['time_numb'] as int?
      ..competitionId = json['competition_id'] as String?
      ..competitionName = json['competition_name'] as String?
      ..p2 = json['p2'] as bool?
      ..dnf = json['dnf'] as bool?;

Map<String, dynamic> _$TimerModelToJson(TimerModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'userName': instance.userName,
      'time_text': instance.timeText,
      'time_numb': instance.timeNumb,
      'competition_id': instance.competitionId,
      'competition_name': instance.competitionName,
      'p2': instance.p2,
      'dnf': instance.dnf,
    };
