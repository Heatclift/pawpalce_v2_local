import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_place_card.dart';

class PawPlaceCardDialog extends StatelessWidget {
  final PlaceModel place;
  final LatLng? currentLoc;
  const PawPlaceCardDialog({
    super.key,
    required this.place,
    this.currentLoc,
  });

  @override
  Widget build(BuildContext context) {
    var placeLoc = (lat: place.latitude, long: place.longitude);
    return Stack(
      children: [
        Positioned(
          bottom: 160,
          left: 18,
          right: 18,
          child: Center(
            child: PawPlaceCard(
              place: place,
              currentLoc: currentLoc,
              placeLoc: placeLoc,
            ),
          ),
        )
      ],
    );
  }
}
