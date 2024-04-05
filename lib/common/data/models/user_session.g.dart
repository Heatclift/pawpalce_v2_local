// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSessionAdapter extends TypeAdapter<UserSession> {
  @override
  final int typeId = 0;

  @override
  UserSession read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSession(
      idToken: fields[1] as String?,
      localId: fields[4] as String?,
      isNewUser: fields[5] as bool,
      phoneNumber: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserSession obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.idToken)
      ..writeByte(4)
      ..write(obj.localId)
      ..writeByte(5)
      ..write(obj.isNewUser)
      ..writeByte(6)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSessionImpl _$$UserSessionImplFromJson(Map<String, dynamic> json) =>
    _$UserSessionImpl(
      idToken: json['idToken'] as String?,
      localId: json['localId'] as String?,
      isNewUser: json['isNewUser'] as bool,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$UserSessionImplToJson(_$UserSessionImpl instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'localId': instance.localId,
      'isNewUser': instance.isNewUser,
      'phoneNumber': instance.phoneNumber,
    };
