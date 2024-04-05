import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_profile.freezed.dart';
part 'pet_profile.g.dart';

@freezed
abstract class PetProfile with _$PetProfile {
  const factory PetProfile({
    String? petId,
    String? petName,
    String? petPhotoUrl,
    String? petOwnerId,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updateAt,
    String? updatedBy,
  }) = _PetProfile;

  factory PetProfile.fromJson(Map<String, dynamic> json) =>
      _$PetProfileFromJson(json);
}
