import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pawplaces/features/profile/data/models/pet_profile.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? firstName,
    String? lastName,
    String? userPhotoUrl,
    DateTime? userStartDate,
    int? noOfPlaceVisits,
    int? noOfDiscoveredPlaces,
    int? noOfDistanceWalked,
    List<PetProfile>? petProfiles,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
