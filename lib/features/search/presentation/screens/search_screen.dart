import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
// import 'package:pawplaces/features/dashboard/presentation/widget/map_filter_dialog.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_place_card.dart';
import 'package:pawplaces/features/search/presentation/stores/search_store.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final store = dpLocator<DashboardStore>();
  final searchStore = SearchStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        var location = store.currentLocation;
        return SingleChildScrollView(
          child: Column(
            children: [
              const Gap(80),
              Row(
                children: [
                  const Gap(15),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 30,
                              color: Colors.black.withOpacity(.15),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          minLines: 1,
                          textInputAction: TextInputAction.search,
                          onChanged: (value) {
                            searchStore.search(key: value);
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
                  // const Gap(10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(100),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         blurRadius: 30,
                  //         color: Colors.black.withOpacity(.15),
                  //       ),
                  //     ],
                  //   ),
                  //   child: CircleAvatar(
                  //     backgroundColor: Colors.white,
                  //     child: IconButton(
                  //       onPressed: () {
                  //         showDialog(
                  //             context: context,
                  //             builder: (context) => MapFilterDialog());
                  //       },
                  //       icon: SvgPicture.asset(
                  //         "assets/icons/filter_icon.svg",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const Gap(15),
                ],
              ),
              const Gap(25),
              AnimatedSize(
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    if (searchStore.isLoading) ...[
                      SpinKitRing(
                        color: ColorPalette.primaryColor,
                        size: 20,
                        lineWidth: 2,
                      ),
                      const Gap(25),
                    ],
                    if (searchStore.places.isEmpty)
                      const Row(
                        children: [
                          Gap(20),
                          Text(
                            "Nearby Places",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    const Gap(15),
                    if (searchStore.places.isEmpty)
                      ...store.places.map(
                        (place) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: PawPlaceCard(
                            place: place,
                            currentLoc:
                                LatLng(location.latitude, location.longitude),
                            placeLoc: (
                              lat: place.latitude,
                              long: place.longitude
                            ),
                          ),
                        ),
                      ),
                    ...searchStore.places.map(
                      (place) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: PawPlaceCard(
                          place: place,
                          currentLoc:
                              LatLng(location.latitude, location.longitude),
                          placeLoc: (
                            lat: place.latitude,
                            long: place.longitude
                          ),
                        ),
                      ),
                    ),
                  ],
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
