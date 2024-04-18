// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardStore on _DashboardStore, Store {
  Computed<List<PlaceModel>>? _$filteredPlacesComputed;

  @override
  List<PlaceModel> get filteredPlaces => (_$filteredPlacesComputed ??=
          Computed<List<PlaceModel>>(() => super.filteredPlaces,
              name: '_DashboardStore.filteredPlaces'))
      .value;

  late final _$errorAtom =
      Atom(name: '_DashboardStore.error', context: context);

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

  late final _$currentLocationAtom =
      Atom(name: '_DashboardStore.currentLocation', context: context);

  @override
  Position get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(Position value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DashboardStore.isLoading', context: context);

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

  late final _$filtersAtom =
      Atom(name: '_DashboardStore.filters', context: context);

  @override
  ObservableList<String> get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(ObservableList<String> value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  late final _$lastScreenPositionAtom =
      Atom(name: '_DashboardStore.lastScreenPosition', context: context);

  @override
  Position get lastScreenPosition {
    _$lastScreenPositionAtom.reportRead();
    return super.lastScreenPosition;
  }

  @override
  set lastScreenPosition(Position value) {
    _$lastScreenPositionAtom.reportWrite(value, super.lastScreenPosition, () {
      super.lastScreenPosition = value;
    });
  }

  late final _$futureAtom =
      Atom(name: '_DashboardStore.future', context: context);

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

  late final _$placesAtom =
      Atom(name: '_DashboardStore.places', context: context);

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

  late final _$markersAtom =
      Atom(name: '_DashboardStore.markers', context: context);

  @override
  ObservableSet<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableSet<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$currLocIconAtom =
      Atom(name: '_DashboardStore.currLocIcon', context: context);

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

  late final _$unlockPlaceAsyncAction =
      AsyncAction('_DashboardStore.unlockPlace', context: context);

  @override
  Future<bool> unlockPlace(String placeId) {
    return _$unlockPlaceAsyncAction.run(() => super.unlockPlace(placeId));
  }

  late final _$loadMarkersAsyncAction =
      AsyncAction('_DashboardStore.loadMarkers', context: context);

  @override
  Future<void> loadMarkers({Position? position, double zoom = 15}) {
    return _$loadMarkersAsyncAction
        .run(() => super.loadMarkers(position: position, zoom: zoom));
  }

  late final _$_DashboardStoreActionController =
      ActionController(name: '_DashboardStore', context: context);

  @override
  void setCurrentLocation(Position position) {
    final _$actionInfo = _$_DashboardStoreActionController.startAction(
        name: '_DashboardStore.setCurrentLocation');
    try {
      return super.setCurrentLocation(position);
    } finally {
      _$_DashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(String filter) {
    final _$actionInfo = _$_DashboardStoreActionController.startAction(
        name: '_DashboardStore.setFilter');
    try {
      return super.setFilter(filter);
    } finally {
      _$_DashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
currentLocation: ${currentLocation},
isLoading: ${isLoading},
filters: ${filters},
lastScreenPosition: ${lastScreenPosition},
future: ${future},
places: ${places},
markers: ${markers},
currLocIcon: ${currLocIcon},
filteredPlaces: ${filteredPlaces}
    ''';
  }
}
