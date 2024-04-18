// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      reviewId: json['reviewId'] as String,
      userId: json['userId'] as String,
      reviewDetails: json['reviewDetails'] as String,
      place: json['locationDetails'] == null
          ? null
          : PlaceModel.fromJson(
              json['locationDetails'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String,
      locationId: json['locationId'] as String,
      isArchived: json['isArchived'] as bool? ?? false,
      isAnonymous: json['isAnonymous'] as bool? ?? false,
      isNotPetFriendly: json['isNotPetFriendly'] as bool? ?? false,
      rating: (json['rating'] as num).toDouble(),
      areasAvailable: (json['areasAvailable'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reviewPhotos: (json['reviewPhotos'] as List<dynamic>)
          .map((e) => ReviewPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewerName: json['reviewerName'] as String,
      reviewerPhotoUrl: json['reviewerPhotoUrl'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'userId': instance.userId,
      'reviewDetails': instance.reviewDetails,
      'locationDetails': instance.place,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'locationId': instance.locationId,
      'isArchived': instance.isArchived,
      'isAnonymous': instance.isAnonymous,
      'isNotPetFriendly': instance.isNotPetFriendly,
      'rating': instance.rating,
      'areasAvailable': instance.areasAvailable,
      'reviewPhotos': instance.reviewPhotos,
      'reviewerName': instance.reviewerName,
      'reviewerPhotoUrl': instance.reviewerPhotoUrl,
      'email': instance.email,
    };
