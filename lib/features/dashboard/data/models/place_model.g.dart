// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      placeId: json['placeId'] as String,
      placeName: json['locationName'] as String,
      thumbnail: json['googlePhotoUrl'] as String? ??
          "https://loremflickr.com/128/101",
      placeDescription: json['placeDescription'] as String?,
      category: json['category'] as String? ?? "pethotel",
      placeRating: (json['googleRating'] as num?)?.toDouble() ?? 0.0,
      placeRatingCount: json['googleRatingCount'] as int? ?? 0,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'locationName': instance.placeName,
      'googlePhotoUrl': instance.thumbnail,
      'placeDescription': instance.placeDescription,
      'category': instance.category,
      'googleRating': instance.placeRating,
      'googleRatingCount': instance.placeRatingCount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
