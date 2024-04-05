import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/gallery_page.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/overview_page.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/reviews_page.dart';
import 'package:share_plus/share_plus.dart';

class PlaceDetailsScreen extends StatefulWidget {
  static String routeName = "PlaceDetailsScreen";
  static String route = "/PlaceDetailsScreen";
  const PlaceDetailsScreen({super.key});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      "https://loremflickr.com/375/265",
                      fit: BoxFit.cover,
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
                        "Shop details",
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
                              const Text(
                                "Perk Up Café - Freshly Brewed",
                                maxLines: 2,
                                style: TextStyle(
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
                                  Text(
                                    "4.3 | 3.5 km | Open until 9:00pm",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: ColorPalette.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorPalette.borderColor,
                              width: 2,
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/book_mark.svg",
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            Share.share(
                              'Check out Perk Up Café on PawPlaces: https://pawplaces.app/Dashboard?pawplace=111',
                              subject: "Check out Perk Up Café on PawPlaces",
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
              children: const [
                OverviewPage(),
                ReviewsPage(),
                GalleryPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
