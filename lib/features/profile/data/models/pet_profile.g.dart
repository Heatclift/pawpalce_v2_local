// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetProfileImpl _$$PetProfileImplFromJson(Map<String, dynamic> json) =>
    _$PetProfileImpl(
      petId: json['petId'] as String?,
      petName: json['petName'] as String?,
      petPhotoUrl: json['petPhotoUrl'] as String?,
      petOwnerId: json['petOwnerId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$PetProfileImplToJson(_$PetProfileImpl instance) =>
    <String, dynamic>{
      'petId': instance.petId,
      'petName': instance.petName,
      'petPhotoUrl': instance.petPhotoUrl,
      'petOwnerId': instance.petOwnerId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'updateAt': instance.updateAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };
