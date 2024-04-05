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
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  ObservableList<PlaceModel> places = ObservableList.of(<PlaceModel>[]);

  @observable
  ObservableSet<Marker> markers = ObservableSet.of(<Marker>{});

  @observable
  BitmapDescriptor? currLocIcon;

  @action
  void setCurrentLocation(Position position) {
    currentLocation = currentLocation = position;
  }

  String placeIcon(String cat) {
    switch (cat) {
      case "appartment":
        return MapPinAssets.apartment;

      case "cafe":
        return MapPinAssets.cafe;

      case "gooming":
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
        return MapPinAssets.restaurant;
    }
  }

  @action
  Future<void> loadMarkers() async {
    isLoading = true;
    var location = await _locationService.getLocation();
    var placesResult = await placeRepo.getPlaces(
      lat: location.latitude,
      long: location.longitude,
      zoom: 15,
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
    for (var place in places) {
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
