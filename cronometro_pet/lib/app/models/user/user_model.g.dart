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
      userId: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      password: fields[3] as String?,
      verified: fields[5] as bool?,
      phone: fields[6] as String?,
      profileIcon: fields[11] as String?,
      pronoun: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.verified)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.profileIcon)
      ..writeByte(19)
      ..write(obj.pronoun);
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
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      verified: json['verified'] as bool?,
      phone: json['phone'] as String?,
      profileIcon: json['profile_icon'] as String?,
      pronoun: json['pronoun'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'verified': instance.verified,
      'phone': instance.phone,
      'profile_icon': instance.profileIcon,
      'pronoun': instance.pronoun,
    };
