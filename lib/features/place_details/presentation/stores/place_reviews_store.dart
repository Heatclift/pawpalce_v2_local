import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/features/place_details/data/models/review_model.dart';
import 'package:pawplaces/features/place_details/domain/repositries/reviews_repo.dart';

part 'place_reviews_store.g.dart';

class PlaceReviewsStore extends _PlaceReviewsStore with _$PlaceReviewsStore {
  PlaceReviewsStore() : super();
}

abstract class _PlaceReviewsStore with Store {
  final repo = ReviewRepository();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  ObservableList<Review> reviews = ObservableList<Review>();

  @computed
  double get rateAvg => reviews.isNotEmpty
      ? (reviews.fold(
              0.0, (previousValue, element) => previousValue + element.rating) /
          reviews.length)
      : 0.0;

  @computed
  int get notePetFrenCount => reviews.fold(
      0,
      (previousValue, element) =>
          (element.isNotPetFriendly ? previousValue++ : previousValue));

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
  Future<void> getPlaceReviews(String placeId) async {
    isLoading = true;
    final revRes = await repo.getReveiwsByPlace(placeId);
    reviews.clear();
    reviews.addAll(revRes);
    isLoading = false;
  }

  @action
  Future<void> getUserReviews(String userId) async {
    isLoading = true;
    final revRes = await repo.getReveiwsByuser(userId);
    reviews.clear();
    reviews.addAll(revRes);
    isLoading = false;
  }
}
