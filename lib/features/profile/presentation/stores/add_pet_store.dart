import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/profile/data/models/pet_type.dart';
import 'package:pawplaces/features/profile/domain/repositories/profile_repo.dart';
import 'package:pawplaces/features/profile/presentation/stores/profile_store.dart';
import 'package:pawplaces/features/profile/presentation/widgets/pet_added_dialog.dart';
import 'package:pawplaces/main.dart';

part 'add_pet_store.g.dart';

class AddPetStore extends _AddPetStore with _$AddPetStore {
  AddPetStore() : super();
}

abstract class _AddPetStore with Store {
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
  ObservableList<PetType> petBreeds = ObservableList<PetType>();

  @observable
  String? error;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  XFile? petPic;

  ReactionDisposer? errorReactDispose;

  ReactionDisposer? addedPetReaction;

  void disposeReactions() {
    errorReactDispose?.call();
  }

  @action
  void setSelectedPetType(String label) {
    selectedPetType = petTypes.firstWhere((element) => element.label == label);
  }

  @action
  Future<void> initPetTypes() async {
    isLoading = true;
    final res = await repo.getPetTypes();

    if (res.isNotEmpty) {
      petTypes.clear();
      petTypes.addAll(res);
    }

    isLoading = false;
  }

  @action
  Future<void> initPetBrees([String? typeId]) async {
    isLoading = true;
    final res = await repo.getPetBreeds(typeId);

    if (res.isNotEmpty) {
      petBreeds.clear();
      petBreeds.addAll(res);
    }

    isLoading = false;
  }

  void setupReactions(BuildContext context) {
    initPetTypes();
    initPetBrees();
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

    addedPetReaction = when((p0) => petAdded, () async {
      dpLocator<ProfileStore>().getProfileDetails();
      await showDialog(
        context: context,
        builder: (context) => PetAddedDialog(petName: petname ?? ''),
      );
      router.pop();
    });
  }

  @action
  Future<void> setPicture(XFile picture) async {
    error = null;
    isLoading = true;
    petPic = picture;
    isLoading = false;
  }

  @action
  Future<void> addPet({
    required String petName,
    required String petBirthdate,
    String? petBreedId,
    required String petGender,
    required String petColor,
    required String petRegistrationNumber,
  }) async {
    petAdded = false;
    error = null;
    isLoading = true;
    String? mimed;
    if (petPic != null) {
      final imageBytes = await petPic!.readAsBytes();
      final imageEncoded = base64Encode(imageBytes);
      final fileType = petPic?.path.split(".").last;
      mimed = "data:image/$fileType;base64,$imageEncoded";
    }

    var res = await repo.addPet(
      petName: petName,
      petPic: mimed,
      petBirthdate: petBirthdate,
      petSpeciesId: selectedPetType?.id.toString(),
      petBreedId: petBreedId,
      petGender: petGender,
      petColor: petColor,
      petRegistrationNumber: petRegistrationNumber,
    );
    petname = petName;
    if (res) {
      error = null;
      petAdded = true;
    } else {
      error = "Failed to add pet profile, please try again later.";
      petAdded = false;
    }

    isLoading = false;
  }
}
