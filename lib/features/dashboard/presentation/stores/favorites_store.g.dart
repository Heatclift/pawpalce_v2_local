// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_FavoritesStore.isLoading', context: context);

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

  late final _$favePlacesAtom =
      Atom(name: '_FavoritesStore.favePlaces', context: context);

  @override
  ObservableList<PlaceModel> get favePlaces {
    _$favePlacesAtom.reportRead();
    return super.favePlaces;
  }

  @override
  set favePlaces(ObservableList<PlaceModel> value) {
    _$favePlacesAtom.reportWrite(value, super.favePlaces, () {
      super.favePlaces = value;
    });
  }

  late final _$currLocIconAtom =
      Atom(name: '_FavoritesStore.currLocIcon', context: context);

  @override
  BitmapDescriptor? get currLocIcon {
    _$currLocIconAtom.reportRead();
    return super.currLocIcon;
  }

  @override
  set currLocIcon(BitmapDescriptor? value) {
    _$currLocIconAtom.reportWrite(value, super.currLocIcon, () {
      super.currLocIcon = value;
    });
  }

  late final _$loadFavesAsyncAction =
      AsyncAction('_FavoritesStore.loadFaves', context: context);

  @override
  Future<void> loadFaves() {
    return _$loadFavesAsyncAction.run(() => super.loadFaves());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
favePlaces: ${favePlaces},
currLocIcon: ${currLocIcon}
    ''';
  }
}
