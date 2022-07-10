// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      course: fields[20] as String?,
      userId: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      password: fields[3] as String?,
      verified: fields[5] as bool?,
      phone: fields[6] as String?,
      dateBirth: fields[7] as String?,
      gender: fields[8] as String?,
      genderAtract: fields[9] as String?,
      sexuality: fields[10] as String?,
      profileIcon: fields[11] as String?,
      matchs: (fields[12] as List?)?.cast<MatchModel>(),
      liked: (fields[13] as List?)?.cast<String>(),
      wasLiked: (fields[14] as List?)?.cast<String>(),
      tags: (fields[15] as List?)?.cast<String>(),
      photos: (fields[16] as List?)?.cast<String>(),
      social: (fields[17] as List?)?.cast<SocialModel>(),
      bio: fields[4] as String?,
      age: fields[18] as int?,
      pronoun: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.bio)
      ..writeByte(5)
      ..write(obj.verified)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.dateBirth)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.genderAtract)
      ..writeByte(10)
      ..write(obj.sexuality)
      ..writeByte(11)
      ..write(obj.profileIcon)
      ..writeByte(12)
      ..write(obj.matchs)
      ..writeByte(13)
      ..write(obj.liked)
      ..writeByte(14)
      ..write(obj.wasLiked)
      ..writeByte(15)
      ..write(obj.tags)
      ..writeByte(16)
      ..write(obj.photos)
      ..writeByte(17)
      ..write(obj.social)
      ..writeByte(18)
      ..write(obj.age)
      ..writeByte(19)
      ..write(obj.pronoun)
      ..writeByte(20)
      ..write(obj.course);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      course: json['course'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      verified: json['verified'] as bool?,
      phone: json['phone'] as String?,
      dateBirth: json['date_birth'] as String?,
      gender: json['gender'] as String?,
      genderAtract: json['gender_atract'] as String?,
      sexuality: json['sexuality'] as String?,
      profileIcon: json['profile_icon'] as String?,
      matchs: (json['matchs'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      liked:
          (json['liked'] as List<dynamic>?)?.map((e) => e as String).toList(),
      wasLiked: (json['was_liked'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      social: (json['social'] as List<dynamic>?)
          ?.map((e) => SocialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bio: json['bio'] as String?,
      age: json['age'] as int?,
      pronoun: json['pronoun'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'bio': instance.bio,
      'verified': instance.verified,
      'phone': instance.phone,
      'date_birth': instance.dateBirth,
      'gender': instance.gender,
      'gender_atract': instance.genderAtract,
      'sexuality': instance.sexuality,
      'profile_icon': instance.profileIcon,
      'matchs': instance.matchs,
      'liked': instance.liked,
      'was_liked': instance.wasLiked,
      'tags': instance.tags,
      'photos': instance.photos,
      'social': instance.social,
      'age': instance.age,
      'pronoun': instance.pronoun,
      'course': instance.course,
    };
