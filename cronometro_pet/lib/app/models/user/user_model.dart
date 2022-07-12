import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'user_id')
  String? userId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? password;

  @HiveField(5)
  bool? verified;

  @HiveField(6)
  String? phone;

  @HiveField(11)
  @JsonKey(name: 'profile_icon')
  String? profileIcon;

  @HiveField(19)
  String? pronoun;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.verified,
    this.phone,
    this.profileIcon,
    this.pronoun,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
