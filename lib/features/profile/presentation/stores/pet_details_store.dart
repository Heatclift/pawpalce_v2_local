import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/features/profile/data/models/pet_model.dart';
import 'package:pawplaces/features/profile/domain/repositories/profile_repo.dart';

part 'pet_details_store.g.dart';

class PetDetailsStore extends _PetDetailsStore with _$PetDetailsStore {
  PetDetailsStore() : super();
}

abstract class _PetDetailsStore with Store {
  final repo = ProfileRepo();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  PetModel? pet;

  @computed
  bool get hasPet => pet != null;

  ReactionDisposer? errorReactDispose;

  void disposeReactions() {
    errorReactDispose?.call();
  }

  void setupReactions(BuildContext context) {
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

  @action
  Future<bool> deletePet(String petId) async {
    error = null;
    isLoading = true;
    final res = await repo.deletePet(petId);
    if (res) {
      error = null;
    } else {
      error = "Error deleting pet records.";
    }
    isLoading = false;
    return res;
  }
}
