import 'package:pawplaces/common/data/sources/pawplace_api.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/profile/data/models/pet_model.dart';
import 'package:pawplaces/features/profile/data/models/pet_type.dart';
import 'package:pawplaces/features/profile/data/models/user_model.dart';

class ProfileRepo {
  final api = PawPlaceApi.create();
  Future<UserModel?> getProfileDetails() async {
    var session = await SessionService.getSession();
    var result = await api.getProfile("${session?.localId}");

    if (result.isSuccessful) {
      final body = result.body;
      if (body["status"] == "success" && body["data"] != null) {
        var user = UserModel.fromJson(body["data"]);
        return user;
      }
    }
    return null;
  }

  Future<bool> updateProfileInfo({
    String? email,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
  }) async {
    var session = await SessionService.getSession();
    final payload = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "dateOfBirth": dateOfBirth,
      "userId": session?.localId,
    };
    var result = await api.updateProfileInfo(payload);

    if (result.isSuccessful) {
      final body = result.body;
      return body["status"] == "success";
    }
    return false;
  }

  Future<bool> updateProfilePic(String base64File) async {
    var session = await SessionService.getSession();
    final payload = {
      "userId": session?.localId,
      "photoFile": base64File,
    };
    var result = await api.updateProfile(payload);

    if (result.isSuccessful) {
      final body = result.body;
      return body["status"] == "success";
    }
    return false;
  }

  Future<bool> addPet({
    required String petName,
    String? petPic,
    required String petBirthdate,
    String? petSpeciesId,
    String? petBreedId,
    required String petGender,
    required String petColor,
    required String petRegistrationNumber,
  }) async {
    var session = await SessionService.getSession();
    final payload = {
      "petOwnerId": session?.localId,
      "petName": petName,
      "petPhotoFile": petPic,
      "petBirthdate": petBirthdate,
      "petSpeciesId": petSpeciesId,
      "petBreedId": petBreedId,
      "petGender": petGender,
      "petColor": petColor,
      "petRegistrationNumber": petRegistrationNumber,
    };
    var result = await api.addPet(payload);

    if (result.isSuccessful) {
      final body = result.body;
      return body["status"] == "success";
    }
    return false;
  }

  Future<bool> updatePet({
    required String petId,
    required String petName,
    String? petPic,
    required String petBirthdate,
    String? petSpeciesId,
    String? petBreedId,
    required String petGender,
    required String petColor,
    required String petRegistrationNumber,
  }) async {
    var session = await SessionService.getSession();
    final payload = {
      "petId": petId,
      "petOwnerId": session?.localId,
      "petPhotoFile": petPic,
      "petName": petName,
      "petBirthdate": petBirthdate,
      "petSpeciesId": petSpeciesId,
      "petBreedId": petBreedId,
      "petGender": petGender,
      "petColor": petColor,
      "petRegistrationNumber": petRegistrationNumber,
    };
    var result = await api.updatePetDetails(payload);

    if (result.isSuccessful) {
      final body = result.body;
      return body["status"] == "success";
    }
    return false;
  }

  Future<List<PetType>> getPetTypes() async {
    var result = await api.getType();
    var petTypes = <PetType>[];
    if (result.isSuccessful) {
      final body = result.body;
      final data = body["data"] as List<dynamic>;
      petTypes = data.map((e) => PetType.fromJson(e)).toList();
    }
    return petTypes;
  }

  Future<List<PetType>> getPetBreeds([String? typeId]) async {
    var result = await api.getBreed(typeId);
    var petTypes = <PetType>[];
    if (result.isSuccessful) {
      final body = result.body;
      final data = body["data"] as List<dynamic>;
      petTypes = data.map((e) => PetType.fromJson(e)).toList();
    }
    return petTypes;
  }

  Future<bool> deletePet(String petId) async {
    var result = await api.deletePet(petId);
    if (result.isSuccessful) {
      final body = result.body;
      return body["status"] == "success";
    }
    return false;
  }

  Future<PetModel?> getPetDetails(String petId) async {
    var result = await api.getPetDetails(petId);
    if (result.isSuccessful) {
      final body = result.body;
      var data = body["data"];
      if (data != null) {
        final pet = PetModel.fromJson(data);
        return pet;
      }
    }
    return null;
  }
}
