// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceDetailsImpl _$$PlaceDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PlaceDetailsImpl(
      locationId: json['locationId'] as String,
      indoorVotes: json['indoorVotes'] as int,
      outdoorVotes: json['outdoorVotes'] as int,
      bothVotes: json['bothVotes'] as int,
      formattedAddress: json['formattedAddress'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      googleMapsURL: json['googleMapsURL'] as String,
      locationName: json['locationName'] as String,
      locationNameLanguage: json['locationNameLanguage'] as String,
      googlePhotoUrl: json['googlePhotoUrl'] as String?,
      distance: (json['distance'] as num).toDouble(),
      isPetFriendly: json['isPetFriendly'] as bool,
      isFavorite: json['isFavorite'] as bool,
      category: json['category'] as String,
      openNow: json['openNow'] as bool,
      openingHours: (json['openingHours'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$$PlaceDetailsImplToJson(_$PlaceDetailsImpl instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'indoorVotes': instance.indoorVotes,
      'outdoorVotes': instance.outdoorVotes,
      'bothVotes': instance.bothVotes,
      'formattedAddress': instance.formattedAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'googleMapsURL': instance.googleMapsURL,
      'locationName': instance.locationName,
      'locationNameLanguage': instance.locationNameLanguage,
      'googlePhotoUrl': instance.googlePhotoUrl,
      'distance': instance.distance,
      'isPetFriendly': instance.isPetFriendly,
      'isFavorite': instance.isFavorite,
      'category': instance.category,
      'openNow': instance.openNow,
      'openingHours': instance.openingHours,
    };
