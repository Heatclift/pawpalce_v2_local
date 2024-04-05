// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userPhotoUrl: json['userPhotoUrl'] as String?,
      userStartDate: json['userStartDate'] == null
          ? null
          : DateTime.parse(json['userStartDate'] as String),
      noOfPlaceVisits: json['noOfPlaceVisits'] as int?,
      noOfDiscoveredPlaces: json['noOfDiscoveredPlaces'] as int?,
      noOfDistanceWalked: json['noOfDistanceWalked'] as int?,
      petProfiles: (json['petProfiles'] as List<dynamic>?)
          ?.map((e) => PetProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userPhotoUrl': instance.userPhotoUrl,
      'userStartDate': instance.userStartDate?.toIso8601String(),
      'noOfPlaceVisits': instance.noOfPlaceVisits,
      'noOfDiscoveredPlaces': instance.noOfDiscoveredPlaces,
      'noOfDistanceWalked': instance.noOfDistanceWalked,
      'petProfiles': instance.petProfiles,
    };
