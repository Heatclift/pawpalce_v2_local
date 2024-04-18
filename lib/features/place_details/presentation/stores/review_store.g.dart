// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReviewStore on _ReviewStore, Store {
  late final _$reviewRatingAtom =
      Atom(name: '_ReviewStore.reviewRating', context: context);

  @override
  double get reviewRating {
    _$reviewRatingAtom.reportRead();
    return super.reviewRating;
  }

  @override
  set reviewRating(double value) {
    _$reviewRatingAtom.reportWrite(value, super.reviewRating, () {
      super.reviewRating = value;
    });
  }

  late final _$reviewAvgRatingAtom =
      Atom(name: '_ReviewStore.reviewAvgRating', context: context);

  @override
  double get reviewAvgRating {
    _$reviewAvgRatingAtom.reportRead();
    return super.reviewAvgRating;
  }

  @override
  set reviewAvgRating(double value) {
    _$reviewAvgRatingAtom.reportWrite(value, super.reviewAvgRating, () {
      super.reviewAvgRating = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ReviewStore.isLoading', context: context);

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

  late final _$areasAtom = Atom(name: '_ReviewStore.areas', context: context);

  @override
  String? get areas {
    _$areasAtom.reportRead();
    return super.areas;
  }

  @override
  set areas(String? value) {
    _$areasAtom.reportWrite(value, super.areas, () {
      super.areas = value;
    });
  }

  late final _$isSubmittedAtom =
      Atom(name: '_ReviewStore.isSubmitted', context: context);

  @override
  bool get isSubmitted {
    _$isSubmittedAtom.reportRead();
    return super.isSubmitted;
  }

  @override
  set isSubmitted(bool value) {
    _$isSubmittedAtom.reportWrite(value, super.isSubmitted, () {
      super.isSubmitted = value;
    });
  }

  late final _$isNotPetFriendlyAtom =
      Atom(name: '_ReviewStore.isNotPetFriendly', context: context);

  @override
  bool get isNotPetFriendly {
    _$isNotPetFriendlyAtom.reportRead();
    return super.isNotPetFriendly;
  }

  @override
  set isNotPetFriendly(bool value) {
    _$isNotPetFriendlyAtom.reportWrite(value, super.isNotPetFriendly, () {
      super.isNotPetFriendly = value;
    });
  }

  late final _$petnameAtom =
      Atom(name: '_ReviewStore.petname', context: context);

  @override
  String? get petname {
    _$petnameAtom.reportRead();
    return super.petname;
  }

  @override
  set petname(String? value) {
    _$petnameAtom.reportWrite(value, super.petname, () {
      super.petname = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ReviewStore.error', context: context);

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

  late final _$futureAtom = Atom(name: '_ReviewStore.future', context: context);

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

  late final _$reviewPhotosAtom =
      Atom(name: '_ReviewStore.reviewPhotos', context: context);

  @override
  ObservableList<String> get reviewPhotos {
    _$reviewPhotosAtom.reportRead();
    return super.reviewPhotos;
  }

  @override
  set reviewPhotos(ObservableList<String> value) {
    _$reviewPhotosAtom.reportWrite(value, super.reviewPhotos, () {
      super.reviewPhotos = value;
    });
  }

  late final _$bittenReviewPhotosAtom =
      Atom(name: '_ReviewStore.bittenReviewPhotos', context: context);

  @override
  ObservableList<Uint8List> get bittenReviewPhotos {
    _$bittenReviewPhotosAtom.reportRead();
    return super.bittenReviewPhotos;
  }

  @override
  set bittenReviewPhotos(ObservableList<Uint8List> value) {
    _$bittenReviewPhotosAtom.reportWrite(value, super.bittenReviewPhotos, () {
      super.bittenReviewPhotos = value;
    });
  }

  late final _$addPictureAsyncAction =
      AsyncAction('_ReviewStore.addPicture', context: context);

  @override
  Future<void> addPicture(XFile picture) {
    return _$addPictureAsyncAction.run(() => super.addPicture(picture));
  }

  late final _$submitReviewAsyncAction =
      AsyncAction('_ReviewStore.submitReview', context: context);

  @override
  Future<bool> submitReview(
      {required String reviewDetails, required String locationId}) {
    return _$submitReviewAsyncAction.run(() => super
        .submitReview(reviewDetails: reviewDetails, locationId: locationId));
  }

  @override
  String toString() {
    return '''
reviewRating: ${reviewRating},
reviewAvgRating: ${reviewAvgRating},
isLoading: ${isLoading},
areas: ${areas},
isSubmitted: ${isSubmitted},
isNotPetFriendly: ${isNotPetFriendly},
petname: ${petname},
error: ${error},
future: ${future},
reviewPhotos: ${reviewPhotos},
bittenReviewPhotos: ${bittenReviewPhotos}
    ''';
  }
}
