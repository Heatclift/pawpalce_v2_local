import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/features/place_details/domain/repositries/reviews_repo.dart';

part 'review_store.g.dart';

class ReviewStore extends _ReviewStore with _$ReviewStore {
  ReviewStore() : super();
}

abstract class _ReviewStore with Store {
  final repo = ReviewRepository();

  @observable
  double reviewRating = 1;

  @observable
  double reviewAvgRating = 1;

  @observable
  bool isLoading = false;

  @observable
  String? areas;

  @observable
  bool isSubmitted = false;

  @observable
  bool isNotPetFriendly = false;

  @observable
  String? petname;

  @observable
  String? error;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  ObservableList<String> reviewPhotos = ObservableList<String>();

  @observable
  ObservableList<Uint8List> bittenReviewPhotos = ObservableList<Uint8List>();

  ReactionDisposer? errorReactDispose;

  ReactionDisposer? addedPetReaction;

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
  Future<void> addPicture(XFile picture) async {
    error = null;
    isLoading = true;
    final bitten = await picture.readAsBytes();
    final imageEncoded = base64Encode(bitten);
    final fileType = picture.path.split(".").last;
    final mimed = "data:image/$fileType;base64,$imageEncoded";

    reviewPhotos.add(mimed);
    bittenReviewPhotos.add(bitten);

    isLoading = false;
  }

  @action
  Future<bool> submitReview({
    required String reviewDetails,
    required String locationId,
  }) async {
    error = null;
    isSubmitted = false;
    isLoading = true;
    final res = await repo.addReveiwToPlace(
      reviewDetails: reviewDetails,
      locationId: locationId,
      rating: reviewRating,
      areasAvailable: areas,
      isAnonymous: false,
      isNotPetFriendly: isNotPetFriendly,
      reviewPhotos: reviewPhotos.toList(),
    );
    if (res) {
      error = null;
      isSubmitted = true;
    } else {
      error = "Can't send your review at the moment, please try again later.";
    }
    isSubmitted = res;
    isLoading = false;
    return res;
  }
}
