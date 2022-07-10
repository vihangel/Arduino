import 'package:json_annotation/json_annotation.dart';

import '../social/social_model.dart';

part 'match_model.g.dart';

@JsonSerializable()
// @HiveType(typeId: 1)
class MatchModel {
  // @HiveField(0)
  @JsonKey(name: 'user_id')
  String? userId;

  String? name;

  @JsonKey(name: 'date_birth')
  String? dateBirth;

  List<String>? tags;

  List<String>? photos;

  List<SocialModel>? social;

  MatchModel(
      {this.userId,
      this.name,
      this.dateBirth,
      this.tags,
      this.photos,
      this.social});

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}
