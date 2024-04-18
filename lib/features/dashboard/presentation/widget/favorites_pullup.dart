import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intro/intro.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/favorites_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';

class FavoritesPullupSheet extends StatefulWidget {
  final List<PlaceModel> places;
  final IntroController? introController;
  final LatLng currentLoc;
  const FavoritesPullupSheet(
      {super.key,
      required this.places,
      required this.currentLoc,
      this.introController});

  @override
  State<FavoritesPullupSheet> createState() => _FavoritesPullupSheetState();
}

class _FavoritesPullupSheetState extends State<FavoritesPullupSheet> {
  final GlobalKey _contentKey = GlobalKey();
  final store = dpLocator<DashboardStore>();
  // ignore: unused_field
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
              initialChildSize: 1,
              minChildSize: .16,
              maxChildSize: 1,
              expand: false,
              snap: true,
              snapSizes: const [.16, 1],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    key: _contentKey,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Favorite",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPalette.accentTextDark,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Gap(15),
                      const Divider(),
                      const Gap(15),
                      widget.introController != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: IntroStepTarget(
                                step: 2,
                                controller: widget.introController!,
                                cardDecoration: const IntroCardDecoration(
                                  showPreviousButton: false,
                                  align: IntroCardAlign.outsideBottomLeft,
                                ),
                                onStepWillDeactivate: (willToStep) {
                                  Navigator.of(context).pop();
                                },
                                cardContents: const TextSpan(
                                  text: "Tap here to create a favorites list",
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.goNamed(FavoritesScreen.routeName);
                                  },
                                  child: Row(
                                    children: [
                                      const Gap(5),
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 30,
                                        ),
                                      ),
                                      const Gap(20),
                                      const Text(
                                        "Create a new wishlists",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Gap(15),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  animType: AnimType.bottomSlide,
                                  headerAnimationLoop: false,
                                  btnOkColor: const Color(0xFFFB6021),
                                  dialogType: DialogType.info,
                                  title: "Feature Coming soon...",
                                  btnOkOnPress: () {},
                                ).show();
                              },
                              child: Row(
                                children: [
                                  const Gap(15),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                  const Gap(20),
                                  const Text(
                                    "Create a new wishlists",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Gap(15),
                                ],
                              ),
                            ),
                      const Gap(15),
                      // Row(
                      //   children: [
                      //     const Gap(15),
                      //     Container(
                      //       height: 60,
                      //       width: 60,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(12),
                      //         child: AspectRatio(
                      //           aspectRatio: 1,
                      //           child: Image.network(
                      //             "https://loremflickr.com/100/100",
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const Gap(20),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         const Text(
                      //           "Sips & Sights",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 17,
                      //           ),
                      //         ),
                      //         Text(
                      //           "25 Places",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w400,
                      //             color: ColorPalette.accentText,
                      //             fontSize: 12,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     const Gap(15),
                      //   ],
                      // ),
                      // const Gap(15),
                      // Row(
                      //   children: [
                      //     const Gap(15),
                      //     Container(
                      //       height: 60,
                      //       width: 60,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(12),
                      //         child: AspectRatio(
                      //           aspectRatio: 1,
                      //           child: Image.network(
                      //             "https://loremflickr.com/100/100",
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const Gap(20),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         const Text(
                      //           "Brews & Views",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 17,
                      //           ),
                      //         ),
                      //         Text(
                      //           "10 Places",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w400,
                      //             color: ColorPalette.accentText,
                      //             fontSize: 12,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     const Gap(15),
                      //   ],
                      // ),
                      // const Gap(15),
                      // Row(
                      //   children: [
                      //     const Gap(15),
                      //     Container(
                      //       height: 60,
                      //       width: 60,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(12),
                      //         child: AspectRatio(
                      //           aspectRatio: 1,
                      //           child: Image.network(
                      //             "https://loremflickr.com/100/100",
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const Gap(20),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         const Text(
                      //           "Lake side cafe",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 17,
                      //           ),
                      //         ),
                      //         Text(
                      //           "15 Places",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w400,
                      //             color: ColorPalette.accentText,
                      //             fontSize: 12,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     const Gap(15),
                      //   ],
                      // ),
                      const Gap(50),
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
