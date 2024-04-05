import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsHelper {
  static double calculateDistance(LatLng location1, LatLng location2) {
    const double earthRadiusKm = 6371.0;

    double lat1Radians = _degreesToRadians(location1.latitude);
    double lat2Radians = _degreesToRadians(location2.latitude);
    double deltaLat =
        _degreesToRadians(location2.latitude - location1.latitude);
    double deltaLng =
        _degreesToRadians(location2.longitude - location1.longitude);

    double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1Radians) *
            cos(lat2Radians) *
            sin(deltaLng / 2) *
            sin(deltaLng / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadiusKm * c;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }
}
