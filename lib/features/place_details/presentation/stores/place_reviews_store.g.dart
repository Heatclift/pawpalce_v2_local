// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_reviews_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaceReviewsStore on _PlaceReviewsStore, Store {
  Computed<double>? _$rateAvgComputed;

  @override
  double get rateAvg =>
      (_$rateAvgComputed ??= Computed<double>(() => super.rateAvg,
              name: '_PlaceReviewsStore.rateAvg'))
          .value;
  Computed<int>? _$notePetFrenCountComputed;

  @override
  int get notePetFrenCount => (_$notePetFrenCountComputed ??= Computed<int>(
          () => super.notePetFrenCount,
          name: '_PlaceReviewsStore.notePetFrenCount'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_PlaceReviewsStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_PlaceReviewsStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$reviewsAtom =
      Atom(name: '_PlaceReviewsStore.reviews', context: context);

  @override
  ObservableList<Review> get reviews {
    _$reviewsAtom.reportRead();
    return super.reviews;
  }

  @override
  set reviews(ObservableList<Review> value) {
    _$reviewsAtom.reportWrite(value, super.reviews, () {
      super.reviews = value;
    });
  }

  late final _$futureAtom =
      Atom(name: '_PlaceReviewsStore.future', context: context);

  @override
  ObservableFuture<dynamic> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(ObservableFuture<dynamic> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$getPlaceReviewsAsyncAction =
      AsyncAction('_PlaceReviewsStore.getPlaceReviews', context: context);

  @override
  Future<void> getPlaceReviews(String placeId) {
    return _$getPlaceReviewsAsyncAction
        .run(() => super.getPlaceReviews(placeId));
  }

  late final _$getUserReviewsAsyncAction =
      AsyncAction('_PlaceReviewsStore.getUserReviews', context: context);

  @override
  Future<void> getUserReviews(String userId) {
    return _$getUserReviewsAsyncAction.run(() => super.getUserReviews(userId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
reviews: ${reviews},
future: ${future},
rateAvg: ${rateAvg},
notePetFrenCount: ${notePetFrenCount}
    ''';
  }
}
