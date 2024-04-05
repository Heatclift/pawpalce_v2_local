import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_place_card.dart';

class PlacesDiscovered extends StatefulWidget {
  static String routeName = "PlacesDiscovered";
  static String route = "PlacesDiscovered";
  const PlacesDiscovered({super.key});

  @override
  State<PlacesDiscovered> createState() => _PlacesDiscoveredState();
}

class _PlacesDiscoveredState extends State<PlacesDiscovered> {
  final store = dpLocator<DashboardStore>();

  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.dark, // Dark text for status bar
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        var location = store.currentLocation;
        return SingleChildScrollView(
          child: Column(
            children: [
              const Gap(60),
              Row(
                children: [
                  const Gap(15),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 35,
                    ),
                  ),
                  const Text(
                    "Places Discovered",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Gap(15),
              ...store.places.map(
                (place) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: PawPlaceCard(
                    place: place,
                    currentLoc: LatLng(location.latitude, location.longitude),
                    placeLoc: (lat: place.latitude, long: place.longitude),
                  ),
                ),
              ),
              const Gap(120),
            ],
          ),
        );
      }),
    );
  }
}
