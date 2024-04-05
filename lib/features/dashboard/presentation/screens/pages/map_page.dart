import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/constants/style_strings.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/services/location_service.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/map_filter_dialog.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/nearby_paw_place_list_pullup.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_place_card_dialog.dart';
import 'package:rive/rive.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
    this.onTapSearch,
  });

  final void Function()? onTapSearch;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final store = dpLocator<DashboardStore>();

  StreamSubscription<Position>? locationSub;

  GoogleMapController? _controller;

  static const CameraPosition _initial = CameraPosition(
    target: LatLng(14.5995, 120.9842),
    zoom: 10,
  );

  void pinCurrentLoc(Set<Marker> markers, Position position) {
    var currLocMarker = Marker(
      markerId: const MarkerId("mylocation"),
      position: LatLng(position.latitude, position.longitude),
      icon: store.currLocIcon ?? BitmapDescriptor.defaultMarker,
    );
    if (markers.isNotEmpty) {
      markers.remove(currLocMarker);
    }
    markers.add(currLocMarker);
  }

  Future<void> init() async {
    await store.loadMarkers();
    var locationStream = await dpLocator<LocationService>().getLocationStream();
    locationSub = locationStream.listen((loc) {
      store.setCurrentLocation(loc);
    });
  }

  Future<void> _goToLoc([Position? currentPos]) async {
    final GoogleMapController? controller = _controller;
    var location =
        currentPos ?? await dpLocator<LocationService>().getLocation();
    var campost = CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: 17);

    await controller?.animateCamera(CameraUpdate.newCameraPosition(campost));
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    locationSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Observer(builder: (context) {
            Position? position = store.currentLocation;
            var placeMarkers = store.markers;

            pinCurrentLoc(placeMarkers, position);

            var map = GoogleMap(
              mapType: MapType.normal,
              indoorViewEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: false,
              markers: placeMarkers
                  .map((element) => element.copyWith(
                        onTapParam: element.markerId.value != "mylocation"
                            ? () {
                                var id = element.markerId.value;
                                showDialog(
                                  context: context,
                                  barrierColor: Colors.transparent,
                                  builder: (context) {
                                    return PawPlaceCardDialog(
                                      place: store.places.firstWhere(
                                          (element) => element.placeId == id),
                                      currentLoc: LatLng(
                                        position.latitude,
                                        position.longitude,
                                      ),
                                    );
                                  },
                                );
                              }
                            : null,
                      ))
                  .toSet(),
              trafficEnabled: false,
              style: StyleStrings.mapStyle,
              initialCameraPosition: _initial,
              myLocationEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;

                Future.delayed(
                  const Duration(milliseconds: 2000),
                  () {
                    if (mounted && !store.isLoading) {
                      _goToLoc(store.currentLocation);
                    }
                  },
                );
              },
            );

            if (store.isLoading) {
              return Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned.fill(child: map),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 250,
                              child: RiveAnimation.asset(
                                'assets/animations/search-rive.riv',
                              ),
                            ),
                            Gap(15),
                            Text("Looking for nearby PawPlaces..."),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return map;
            }
          }),
        ),
        Positioned(
          top: 156,
          right: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: SvgPicture.asset(
              //       "assets/icons/more.svg",
              //     ),
              //   ),
              // ),
              // const Gap(16),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () async {
                    final location =
                        await dpLocator<LocationService>().getLocation();
                    _goToLoc(location);
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/gps_center.svg",
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 25,
          right: 20,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(.1),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      minLines: 1,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        widget.onTapSearch?.call();
                      },
                      decoration: InputDecoration(
                        hintText: "Search Anywhere. Anytime",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: ColorPalette.secondaryText,
                        ),
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => MapFilterDialog());
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/filter_icon.svg",
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Observer(builder: (context) {
            var location = store.currentLocation;
            if (store.isLoading) {
              return const SizedBox.shrink();
            }
            return NearbyPlacesPullupSheet(
              currentLoc: LatLng(location.latitude, location.longitude),
              places: store.places,
            );
          }),
        ),
      ],
    );
  }
}
