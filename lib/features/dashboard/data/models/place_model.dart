// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    required String placeId,
    @JsonKey(name: "locationName") required String placeName,
    @JsonKey(name: "googlePhotoUrl")
    @Default("https://loremflickr.com/128/101")
    String thumbnail,
    String? placeDescription,
    @Default("pethotel") String category,
    @JsonKey(name: "googleRating") @Default(0.0) double placeRating,
    @JsonKey(name: "googleRatingCount") @Default(0) int placeRatingCount,
    required double latitude,
    required double longitude,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, Object?> json) =>
      _$PlaceModelFromJson(json);
}
