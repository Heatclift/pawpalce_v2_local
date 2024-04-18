// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/place_details/data/models/review_photo.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
abstract class Review with _$Review {
  factory Review({
    required String reviewId,
    required String userId,
    required String reviewDetails,
    @JsonKey(name: "locationDetails") PlaceModel? place,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
    required String locationId,
    @Default(false) bool isArchived,
    @Default(false) bool isAnonymous,
    @Default(false) bool isNotPetFriendly,
    required double rating,
    List<String>? areasAvailable,
    required List<ReviewPhoto> reviewPhotos,
    required String reviewerName,
    String? reviewerPhotoUrl,
    required String email,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
