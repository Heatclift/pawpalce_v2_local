import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/helpers/maps_helper.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/place_details/presentation/stores/place_details_store.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/gallery_page.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/overview_page.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/reviews_page.dart';
import 'package:share_plus/share_plus.dart';

class PlaceDetailsScreen extends StatefulWidget {
  static String routeName = "PlaceDetailsScreen";
  static String route = "/PlaceDetailsScreen";

  final PlaceModel place;
  final LatLng? currentLoc;

  const PlaceDetailsScreen({super.key, required this.place, this.currentLoc});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen>
    with SingleTickerProviderStateMixin {
  final store = PlaceDetailsStore();
  late TabController tabController;

  @override
  void initState() {
    store.setupReactions(context);
    store.loadPlaceDetails(widget.place.placeId);
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    store.disposeReactions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final distance = widget.currentLoc != null
        ? MapsHelper.calculateDistance(widget.currentLoc!,
                LatLng(widget.place.latitude, widget.place.longitude))
            .toStringAsFixed(1)
        : 0;
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 375 / 265,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Image.network(
                      widget.place.thumbnail,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.network(
                        "https://fakeimg.pl/600x400?text=No+Image",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(.1),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 15,
                  left: 15,
                  child: Row(
                    children: [
                      const Text(
                        "Place details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(.5),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(.1),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.place.placeName,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              // const Gap(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset("assets/icons/paw.png"),
                                  const Gap(5),
                                  Observer(builder: (context) {
                                    final details = store.placeDetails;
                                    return Flexible(
                                      child: Text(
                                        "${widget.place.placeRating.toStringAsFixed(1)} | $distance km | Open ${(details?.openingHours.isNotEmpty ?? false) ? details?.openingHours.first.values.first : 'Unknown'}",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: ColorPalette.secondaryText,
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () async {
                            final res =
                                await store.addToFaves(widget.place.placeId);
                            store.loadPlaceDetails(widget.place.placeId);
                            final isFave =
                                store.placeDetails?.isFavorite ?? false;
                            if (res && !isFave) {
                              AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                                animType: AnimType.bottomSlide,
                                headerAnimationLoop: false,
                                btnOkColor: const Color(0xFFFB6021),
                                dialogType: DialogType.success,
                                title: "Place added to favorites!",
                                btnOkOnPress: () {},
                              ).show();
                            } else {
                              AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                                animType: AnimType.bottomSlide,
                                headerAnimationLoop: false,
                                btnOkColor: const Color(0xFFFB6021),
                                dialogType: DialogType.success,
                                title: "Place removed from favorites!",
                                btnOkOnPress: () {},
                              ).show();
                            }
                          },
                          child: Observer(builder: (context) {
                            final isFave =
                                store.placeDetails?.isFavorite ?? false;
                            return Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    isFave ? ColorPalette.primaryColor : null,
                                border: Border.all(
                                  color: ColorPalette.borderColor,
                                  width: 2,
                                ),
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/book_mark.svg",
                                // ignore: deprecated_member_use
                                color: isFave ? Colors.white : null,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            );
                          }),
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            Share.share(
                              'Check out ${widget.place.placeName} on PawPlaces: https://pawplaces.app/Dashboard?pawplace=${widget.place.placeId}',
                              subject:
                                  "Check out ${widget.place.placeName} on PawPlaces",
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorPalette.borderColor,
                                width: 2,
                              ),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/share.svg",
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: tabController,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Inter",
              fontSize: 18,
              color: ColorPalette.secondaryText,
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
              fontSize: 18,
              color: ColorPalette.primaryColor,
            ),
            tabs: const [
              Tab(
                text: "Overview",
              ),
              Tab(
                text: "Reviews",
              ),
              Tab(
                text: "Gallery",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                OverviewPage(
                  place: widget.place,
                  placeStore: store,
                ),
                ReviewsPage(
                  place: widget.place,
                  placeStore: store,
                ),
                const GalleryPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
