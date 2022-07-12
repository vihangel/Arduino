import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timer_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class TimerModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'user_id')
  String? userId;

  @HiveField(1)
  String? userName;

  @HiveField(2)
  @JsonKey(name: 'time_text')
  String? timeText;

  @HiveField(3)
  @JsonKey(name: 'time_numb')
  int? timeNumb;

  @HiveField(4)
  @JsonKey(name: 'competition_id')
  String? competitionId;

  @HiveField(5)
  @JsonKey(name: 'competition_name')
  String? competitionName;

  @HiveField(6)
  bool? p2;

  @HiveField(7)
  bool? dnf;

  TimerModel({
    this.userId,
  });

  factory TimerModel.fromJson(Map<String, dynamic> json) =>
      _$TimerModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimerModelToJson(this);
}
