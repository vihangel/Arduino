// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      dateBirth: json['date_birth'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      social: (json['social'] as List<dynamic>?)
          ?.map((e) => SocialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'date_birth': instance.dateBirth,
      'tags': instance.tags,
      'photos': instance.photos,
      'social': instance.social,
    };
