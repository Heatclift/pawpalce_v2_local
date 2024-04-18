// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    @JsonKey(name: "locationId") required String placeId,
    @JsonKey(name: "locationName") required String placeName,
    @JsonKey(name: "googlePhotoUrl")
    @Default("https://placehold.co/600x400?text=No+Image")
    String thumbnail,
    @Default(false) bool isPetfriendly,
    @Default(false) bool isFavorite,
    @Default(false) bool isUnlocked,
    String? placeDescription,
    @Default("pethotel") String category,
    @JsonKey(name: "userRatings") @Default(0.0) double placeRating,
    @JsonKey(name: "googleRatingCount") @Default(0) int placeRatingCount,
    required double latitude,
    required double longitude,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, Object?> json) =>
      _$PlaceModelFromJson(json);
}
