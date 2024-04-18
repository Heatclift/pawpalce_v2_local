// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      placeId: json['locationId'] as String,
      placeName: json['locationName'] as String,
      thumbnail: json['googlePhotoUrl'] as String? ??
          "https://placehold.co/600x400?text=No+Image",
      isPetfriendly: json['isPetfriendly'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? false,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      placeDescription: json['placeDescription'] as String?,
      category: json['category'] as String? ?? "pethotel",
      placeRating: (json['userRatings'] as num?)?.toDouble() ?? 0.0,
      placeRatingCount: json['googleRatingCount'] as int? ?? 0,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'locationId': instance.placeId,
      'locationName': instance.placeName,
      'googlePhotoUrl': instance.thumbnail,
      'isPetfriendly': instance.isPetfriendly,
      'isFavorite': instance.isFavorite,
      'isUnlocked': instance.isUnlocked,
      'placeDescription': instance.placeDescription,
      'category': instance.category,
      'userRatings': instance.placeRating,
      'googleRatingCount': instance.placeRatingCount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
