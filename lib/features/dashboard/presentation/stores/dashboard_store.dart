import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/services/location_service.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/domain/constants/map_pin_assets.dart';
import 'package:pawplaces/features/dashboard/domain/repositories/places_repository.dart';

part 'dashboard_store.g.dart';

class DashboardStore extends _DashboardStore with _$DashboardStore {
  DashboardStore() : super();
}

abstract class _DashboardStore with Store {
  final placeRepo = PlacesRepository();
  final _locationService = dpLocator<LocationService>();

  @observable
  String? error;

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

  @observable
  Position currentLocation = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0);

  @observable
  bool isLoading = false;

  @observable
  ObservableList<String> filters = ObservableList<String>();

  @observable
  Position lastScreenPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0);

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  ObservableList<PlaceModel> places = ObservableList.of(<PlaceModel>[]);

  @computed
  List<PlaceModel> get filteredPlaces {
    final filtered =
        places.where((element) => filters.contains(element.category));
    return filtered.toList();
  }

  @observable
  ObservableSet<Marker> markers = ObservableSet.of(<Marker>{});

  @observable
  BitmapDescriptor? currLocIcon;

  @action
  void setCurrentLocation(Position position) {
    currentLocation = currentLocation = position;
  }

  @action
  void setFilter(String filter) {
    if (filters.contains(filter)) {
      filters.remove(filter);
    } else {
      filters.add(filter);
    }
    loadMarkers(position: lastScreenPosition);
  }

  String placeIcon(String cat) {
    switch (cat.toLowerCase()) {
      case "appartment":
        return MapPinAssets.apartment;

      case "cafe":
        return MapPinAssets.cafe;

      case "grooming":
        return MapPinAssets.grooming;

      case "hotel":
        return MapPinAssets.hotel;

      case "park":
        return MapPinAssets.park;

      case "mall":
        return MapPinAssets.mall;

      case "pethospital":
        return MapPinAssets.petHospital;

      case "pethotel":
        return MapPinAssets.petHotel;

      case "petshop":
        return MapPinAssets.petShop;

      case "restaurant":
        return MapPinAssets.restaurant;

      default:
        return MapPinAssets.park;
    }
  }

  @action
  Future<bool> unlockPlace(String placeId) async {
    error = null;
    final res = await placeRepo.unlockPlace(placeId);
    if (res) {
      var place = places.firstWhere((element) => element.placeId == placeId);
      place = place.copyWith(isUnlocked: true);
      places.removeWhere((element) => element.placeId == place.placeId);
      places.add(place);
    } else {
      error = "Can't Unlock Place.";
    }
    return res;
  }

  @action
  Future<void> loadMarkers({
    Position? position,
    double zoom = 15,
  }) async {
    error = null;
    if (position == null) {
      isLoading = true;
    } else {
      lastScreenPosition = position;
    }
    var location = position ?? await _locationService.getLocation();
    var placesResult = await placeRepo.getPlaces(
      lat: location.latitude,
      long: location.longitude,
      zoom: zoom,
    );
    places.clear();
    places.addAll(placesResult);

    currLocIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(20, 20),
      ),
      mipmaps: true,
      MapPinAssets.currLoc,
    );
    markers.clear();
    final placesProc = filters.isNotEmpty ? filteredPlaces : places;
    for (var place in placesProc) {
      var pinIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          size: Size(20, 20),
        ),
        placeIcon(place.category),
      );
      var marker = Marker(
        markerId: MarkerId(place.placeId),
        icon: pinIcon,
        position: LatLng(place.latitude, place.longitude),
      );

      markers.add(marker);
    }
    // await Future.delayed(const Duration(seconds: 5));
    isLoading = false;
  }
}
