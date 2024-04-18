// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      petId: json['petId'] as String?,
      petName: json['petName'] as String?,
      petPhotoUrl: json['petPhotoUrl'] as String?,
      petOwnerId: json['petOwnerId'] as String?,
      petBirthday: json['petBirthday'] as String?,
      petSpeciesId: json['petSpeciesId'] as int?,
      petSpeciesName: json['petSpeciesName'] as String?,
      petBreedId: json['petBreedId'] as String?,
      petBreedName: json['petBreedName'] as String?,
      petGender: json['petGender'] as String?,
      petColor: json['petColor'] as String?,
      petRegistrationNumber: json['petRegistrationNumber'] as String?,
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] as String?,
      updateAt: json['updateAt'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'petId': instance.petId,
      'petName': instance.petName,
      'petPhotoUrl': instance.petPhotoUrl,
      'petOwnerId': instance.petOwnerId,
      'petBirthday': instance.petBirthday,
      'petSpeciesId': instance.petSpeciesId,
      'petSpeciesName': instance.petSpeciesName,
      'petBreedId': instance.petBreedId,
      'petBreedName': instance.petBreedName,
      'petGender': instance.petGender,
      'petColor': instance.petColor,
      'petRegistrationNumber': instance.petRegistrationNumber,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'updateAt': instance.updateAt,
      'updatedBy': instance.updatedBy,
    };
