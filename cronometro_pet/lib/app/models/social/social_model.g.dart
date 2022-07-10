// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialModel _$SocialModelFromJson(Map<String, dynamic> json) => SocialModel(
      twitter: json['twitter'] as String?,
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      whatsapp: json['whatsapp'] as String?,
    );

Map<String, dynamic> _$SocialModelToJson(SocialModel instance) =>
    <String, dynamic>{
      'twitter': instance.twitter,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'whatsapp': instance.whatsapp,
    };
