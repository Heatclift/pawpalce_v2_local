import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/features/place_details/data/models/place_details_model.dart';
import 'package:pawplaces/features/place_details/domain/repositries/place_details_repo.dart';

part 'place_details_store.g.dart';

class PlaceDetailsStore extends _PlaceDetailsStore with _$PlaceDetailsStore {
  PlaceDetailsStore() : super();
}

abstract class _PlaceDetailsStore with Store {
  final repo = PlaceRepository();

  @observable
  double reviewRating = 1;

  @observable
  bool isLoading = false;

  @observable
  PlaceDetails? placeDetails;

  @observable
  bool isNotPetFriendly = false;

  @observable
  String? error;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

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
  Future<PlaceDetails?> loadPlaceDetails(String placeId) async {
    isLoading = true;
    error = null;
    final res = await repo.getPlaceDetails(placeId);
    placeDetails = res;

    if (res == null) {
      error = "Can't load place details, please try again later.";
    }
    isLoading = false;
    return placeDetails;
  }

  @action
  Future<bool> addToFaves(String placeId) async {
    isLoading = true;
    error = null;
    final res = await repo.addPlaceTofavorites(placeId);
    if (!res) {
      error =
          "Can't add place to favorites at this time, please try again later.";
    }
    isLoading = false;
    return res;
  }

  @action
  Future<bool> removeFromFaves(String placeId) async {
    isLoading = true;
    error = null;
    final res = await repo.removePlaceFromfavorites(placeId);
    if (!res) {
      error =
          "Can't remove place from favorites at this time, please try again later.";
    }
    isLoading = false;
    return res;
  }
}
