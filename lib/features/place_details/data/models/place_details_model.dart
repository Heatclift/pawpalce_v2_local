import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_details_model.freezed.dart';
part 'place_details_model.g.dart';

@freezed
class PlaceDetails with _$PlaceDetails {
  const factory PlaceDetails({
    required String locationId,
    required int indoorVotes,
    required int outdoorVotes,
    required int bothVotes,
    required String formattedAddress,
    required double latitude,
    required double longitude,
    required String googleMapsURL,
    required String locationName,
    required String locationNameLanguage,
    String? googlePhotoUrl,
    required double distance,
    required bool isPetFriendly,
    required bool isFavorite,
    required String category,
    required bool openNow,
    required List<Map<String, String>> openingHours,
  }) = _PlaceDetails;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsFromJson(json);
}
