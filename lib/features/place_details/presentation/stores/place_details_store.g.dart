// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaceDetailsStore on _PlaceDetailsStore, Store {
  late final _$reviewRatingAtom =
      Atom(name: '_PlaceDetailsStore.reviewRating', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_PlaceDetailsStore.isLoading', context: context);

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

  late final _$placeDetailsAtom =
      Atom(name: '_PlaceDetailsStore.placeDetails', context: context);

  @override
  PlaceDetails? get placeDetails {
    _$placeDetailsAtom.reportRead();
    return super.placeDetails;
  }

  @override
  set placeDetails(PlaceDetails? value) {
    _$placeDetailsAtom.reportWrite(value, super.placeDetails, () {
      super.placeDetails = value;
    });
  }

  late final _$isNotPetFriendlyAtom =
      Atom(name: '_PlaceDetailsStore.isNotPetFriendly', context: context);

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

  late final _$errorAtom =
      Atom(name: '_PlaceDetailsStore.error', context: context);

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

  late final _$futureAtom =
      Atom(name: '_PlaceDetailsStore.future', context: context);

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

  late final _$loadPlaceDetailsAsyncAction =
      AsyncAction('_PlaceDetailsStore.loadPlaceDetails', context: context);

  @override
  Future<PlaceDetails?> loadPlaceDetails(String placeId) {
    return _$loadPlaceDetailsAsyncAction
        .run(() => super.loadPlaceDetails(placeId));
  }

  late final _$addToFavesAsyncAction =
      AsyncAction('_PlaceDetailsStore.addToFaves', context: context);

  @override
  Future<bool> addToFaves(String placeId) {
    return _$addToFavesAsyncAction.run(() => super.addToFaves(placeId));
  }

  late final _$removeFromFavesAsyncAction =
      AsyncAction('_PlaceDetailsStore.removeFromFaves', context: context);

  @override
  Future<bool> removeFromFaves(String placeId) {
    return _$removeFromFavesAsyncAction
        .run(() => super.removeFromFaves(placeId));
  }

  @override
  String toString() {
    return '''
reviewRating: ${reviewRating},
isLoading: ${isLoading},
placeDetails: ${placeDetails},
isNotPetFriendly: ${isNotPetFriendly},
error: ${error},
future: ${future}
    ''';
  }
}
