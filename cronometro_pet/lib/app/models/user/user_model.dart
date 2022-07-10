import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../match/match_model.dart';
import '../social/social_model.dart';

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

  @HiveField(4)
  String? bio;

  @HiveField(5)
  bool? verified;

  @HiveField(6)
  String? phone;

  @HiveField(7)
  @JsonKey(name: 'date_birth')
  String? dateBirth;

  @HiveField(8)
  String? gender;

  @HiveField(9)
  @JsonKey(name: 'gender_atract')
  String? genderAtract;

  @HiveField(10)
  String? sexuality;

  @HiveField(11)
  @JsonKey(name: 'profile_icon')
  String? profileIcon;

  @HiveField(12)
  List<MatchModel>? matchs;

  //curtiu
  @HiveField(13)
  List<String>? liked;

  //foi curtido
  @HiveField(14)
  @JsonKey(name: 'was_liked')
  List<String>? wasLiked;

  @HiveField(15)
  List<String>? tags;

  @HiveField(16)
  List<String>? photos;

  @HiveField(17)
  List<SocialModel>? social;

  @HiveField(18)
  int? age;

  @HiveField(19)
  String? pronoun;

  @HiveField(20)
  String? course;

  UserModel({
    this.course,
    this.userId,
    this.name,
    this.email,
    this.password,
    this.verified,
    this.phone,
    this.dateBirth,
    this.gender,
    this.genderAtract,
    this.sexuality,
    this.profileIcon,
    this.matchs,
    this.liked,
    this.wasLiked,
    this.tags,
    this.photos,
    this.social,
    this.bio,
    this.age,
    this.pronoun,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
