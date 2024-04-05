import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_place_card.dart';

class NearbyPlacesPullupSheet extends StatefulWidget {
  final List<PlaceModel> places;
  final LatLng currentLoc;
  const NearbyPlacesPullupSheet(
      {super.key, required this.places, required this.currentLoc});

  @override
  State<NearbyPlacesPullupSheet> createState() =>
      _NearbyPlacesPullupSheetState();
}

class _NearbyPlacesPullupSheetState extends State<NearbyPlacesPullupSheet> {
  final GlobalKey _contentKey = GlobalKey();
  double _maxChildHeight = .95;

  double _getContentHeight() {
    final RenderBox renderBox =
        _contentKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  void _maxChildSize(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double contentHeight = _getContentHeight();
    double maxChildSize = contentHeight / screenHeight;
    maxChildSize = maxChildSize.clamp(0.2, 1.0);
    setState(() {
      _maxChildHeight = maxChildSize;
    });
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        _maxChildSize(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).viewPadding.top;

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: topPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),
          SvgPicture.asset(
            "assets/icons/handle_bar.svg",
            width: 50,
            fit: BoxFit.contain,
          ),
          const Gap(10),
          Flexible(
            child: DraggableScrollableSheet(
              initialChildSize: .16,
              minChildSize: .16,
              maxChildSize: _maxChildHeight,
              expand: false,
              snap: true,
              snapSizes: [.16, _maxChildHeight],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    key: _contentKey,
                    children: [
                      Row(
                        children: [
                          const Gap(35),
                          SvgPicture.asset(
                            "assets/icons/places_icon.svg",
                            width: 20,
                            fit: BoxFit.contain,
                          ),
                          const Gap(10),
                          Text(
                            "${widget.places.length}+ PawPlaces Available",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.accentTextDark,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const Gap(15),
                      ...widget.places.map(
                        (place) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: PawPlaceCard(
                            place: place,
                            currentLoc: widget.currentLoc,
                            placeLoc: (
                              lat: place.latitude,
                              long: place.longitude
                            ),
                          ),
                        ),
                      ),
                      const Gap(120),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
