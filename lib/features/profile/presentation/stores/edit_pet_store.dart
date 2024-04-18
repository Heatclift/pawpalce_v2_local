import 'dart:convert';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/profile/data/models/pet_model.dart';
import 'package:pawplaces/features/profile/data/models/pet_type.dart';
import 'package:pawplaces/features/profile/domain/repositories/profile_repo.dart';
import 'package:pawplaces/features/profile/presentation/stores/profile_store.dart';
import 'package:pawplaces/features/profile/presentation/widgets/pet_updated_dialog.dart';
import 'package:pawplaces/main.dart';

part 'edit_pet_store.g.dart';

class EditPetStore extends _EditPetStore with _$EditPetStore {
  EditPetStore() : super();
}

abstract class _EditPetStore with Store {
  final repo = ProfileRepo();
  @observable
  bool isLoading = false;

  @observable
  bool petAdded = false;

  @observable
  String? petname;

  @observable
  PetType? selectedPetType;

  @observable
  ObservableList<PetType> petTypes = ObservableList<PetType>();

  @observable
  String? error;

  @observable
  PetModel? pet;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  XFile? petPic;

  @observable
  Uint8List? petPicBytes;

  ReactionDisposer? errorReactDispose;

  ReactionDisposer? updatedPetReaction;

  void disposeReactions() {
    errorReactDispose?.call();
  }

  @action
  void setSelectedPetType(String label) {
    selectedPetType = petTypes.firstWhere((element) => element.label == label);
  }

  @action
  Future<void> initPetTypes(String? initPetType) async {
    isLoading = true;
    final res = await repo.getPetTypes();

    if (res.isNotEmpty) {
      petTypes.clear();
      petTypes.addAll(res);

      if (initPetType != null) {
        setSelectedPetType(initPetType);
      }
    }

    isLoading = false;
  }

  @action
  Future<void> initPetBreed() async {
    isLoading = true;
    final res = await repo.getPetTypes();

    if (res.isNotEmpty) {
      petTypes.clear();
      petTypes.addAll(res);
    }

    isLoading = false;
  }

  @action
  Future<PetModel?> getPetDetails(String petId) async {
    error = null;
    isLoading = true;
    pet = await repo.getPetDetails(petId);
    if (pet == null) {
      error = "Error on getting your pet details.";
    } else {
      error = null;
    }
    isLoading = false;
    return pet;
  }

  Future<void> setupReactions(BuildContext context, String petId) async {
    await getPetDetails(petId);
    await initPetTypes(pet?.petSpeciesName);
    disposeReactions();
    errorReactDispose = reaction(
      (error) => this.error,
      (error) {
        if (error != null) {
          AwesomeDialog(
            context: context,
            animType: AnimType.bottomSlide,
            headerAnimationLoop: false,
            btnOkColor: const Color(0xFFFB6021),
            dialogType: DialogType.error,
            title: error,
            btnOkOnPress: () {},
          ).show();
        }
      },
      fireImmediately: false,
    );

    updatedPetReaction = when((p0) => petAdded, () async {
      dpLocator<ProfileStore>().getProfileDetails();
      await showDialog(
        context: context,
        builder: (context) => PetUpadtedDialog(petName: petname ?? ''),
      );
      router.pop();
    });
  }

  @action
  Future<void> setPicture(XFile picture) async {
    error = null;
    isLoading = true;
    petPic = picture;
    petPicBytes = await picture.readAsBytes();
    isLoading = false;
  }

  @action
  Future<void> updatedPet(
      {required String petName,
      required String petBirthdate,
      required String petGender,
      required String petColor,
      required String petRegistrationNumber,
      required String petId}) async {
    petAdded = false;
    error = null;
    isLoading = true;
    String? mimed;
    if (petPicBytes != null) {
      final imageEncoded = base64Encode(petPicBytes!);
      final fileType = petPic?.path.split(".").last;
      mimed = "data:image/$fileType;base64,$imageEncoded";
    }

    var res = await repo.updatePet(
      petId: petId,
      petName: petName,
      petPic: mimed,
      petBirthdate: petBirthdate,
      petSpeciesId: selectedPetType?.id.toString(),
      petGender: petGender,
      petColor: petColor,
      petRegistrationNumber: petRegistrationNumber,
    );
    petname = petName;
    if (res) {
      error = null;
      petAdded = true;
    } else {
      error = "Failed to update pet profile, please try again later.";
      petAdded = false;
    }

    isLoading = false;
  }
}
