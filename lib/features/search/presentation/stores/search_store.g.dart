// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on _SearchStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SearchStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_SearchStore.error', context: context);

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

  late final _$placesAtom = Atom(name: '_SearchStore.places', context: context);

  @override
  ObservableList<PlaceModel> get places {
    _$placesAtom.reportRead();
    return super.places;
  }

  @override
  set places(ObservableList<PlaceModel> value) {
    _$placesAtom.reportWrite(value, super.places, () {
      super.places = value;
    });
  }

  late final _$futureAtom = Atom(name: '_SearchStore.future', context: context);

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

  late final _$searchAsyncAction =
      AsyncAction('_SearchStore.search', context: context);

  @override
  Future<List<PlaceModel>> search({required String key}) {
    return _$searchAsyncAction.run(() => super.search(key: key));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
places: ${places},
future: ${future}
    ''';
  }
}
