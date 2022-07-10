import 'package:json_annotation/json_annotation.dart';

part 'social_model.g.dart';

@JsonSerializable()
// @HiveType(typeId: 1)
class SocialModel {
  // @HiveField(0)
  @JsonKey(ignore: null)
  String? twitter;

  @JsonKey(ignore: null)
  String? facebook;

  @JsonKey(ignore: null)
  String? instagram;

  @JsonKey(ignore: null)
  String? whatsapp;

  SocialModel({this.twitter, this.facebook, this.instagram, this.whatsapp});

  factory SocialModel.fromJson(Map<String, dynamic> json) =>
      _$SocialModelFromJson(json);
  Map<String, dynamic> toJson() => _$SocialModelToJson(this);
}
