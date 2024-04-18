import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

@freezed
class PetModel with _$PetModel {
  factory PetModel({
    String? petId,
    String? petName,
    String? petPhotoUrl,
    String? petOwnerId,
    String? petBirthday,
    int? petSpeciesId,
    String? petSpeciesName,
    String? petBreedId,
    String? petBreedName,
    String? petGender,
    String? petColor,
    String? petRegistrationNumber,
    String? createdAt,
    String? createdBy,
    String? updateAt,
    String? updatedBy,
  }) = _PetModel;

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);
}
