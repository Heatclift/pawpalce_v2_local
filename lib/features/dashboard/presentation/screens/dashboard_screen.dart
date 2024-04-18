import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:app_links/app_links.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intro/intro.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/presentation/dashboard_modal_triggers.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/pages/map_page.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/favorites_pullup.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_city_leaderboard_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_country_leaderboard_screen.dart';
import 'package:pawplaces/features/login/presentation/screens/login_with_phone_screen.dart';
import 'package:pawplaces/features/place_details/presentation/stores/place_details_store.dart';

import 'package:pawplaces/features/profile/presentation/screens/profile_screen.dart';
import 'package:pawplaces/features/register/presentation/screens/register_screen.dart';
import 'package:pawplaces/features/search/presentation/screens/search_screen.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "Dashboard";
  static String route = "/Dashboard";
  final Map<String, dynamic>? params;
  const Dashboard({super.key, this.params});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _bottomNavIndex = 4;
  final store = dpLocator<DashboardStore>();
  final placeDetailsStore = PlaceDetailsStore();
  late PageController pageController;
  final introController = IntroController(stepCount: 12);
  final _appLinks = AppLinks();

  final iconList = [
    (icon: "assets/images/profile.svg", text: "Pawfile"),
    (icon: "assets/icons/world.svg", text: "PawCountry"),
    (icon: "assets/icons/city.svg", text: "PawCity"),
    (icon: "assets/images/search.svg", text: "Search"),
  ];

  Future<void> init(BuildContext context) async {
    _appLinks.allUriLinkStream.listen((uri) async {
      processLinks(context, uri);
    });
    var uri = await _appLinks.getInitialAppLink();
    if (uri != null) {
      // ignore: use_build_context_synchronously
      processLinks(context, uri);
    } else {
      startIntro();
    }
  }

  Future<void> processLinks(BuildContext context, Uri uri) async {
    if (uri.queryParameters.containsKey("pawplace")) {
      final placeId = uri.queryParameters["pawplace"];
      if (placeId != null) {
        var placeDetails = await placeDetailsStore.loadPlaceDetails(placeId);

        if (placeDetails != null) {
          final place = PlaceModel(
            placeId: placeId,
            placeName: placeDetails.locationName,
            latitude: placeDetails.latitude,
            longitude: placeDetails.longitude,
            thumbnail: placeDetails.googlePhotoUrl ??
                "https://placehold.co/600x400?text=No+Image",
          );

          final loc = store.currentLocation;
          if (mounted) {
            DashboardModalTriggers.showpPlaceDetails(
              // ignore: use_build_context_synchronously
              context,
              place,
              LatLng(loc.latitude, loc.longitude),
            );
          }
        }
      }
    }
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 4);
    init(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> startIntro() async {
    final isOnboarded = await SessionService.isOnboarded();
    final isRewared = await SessionService.isRewarded();
    final session = await SessionService.getSession();
    if (!isOnboarded) {
      Future.delayed(const Duration(seconds: 1), () {
        introController.start(context);
      });
    } else {
      if (mounted) {
        if (!isRewared && (session != null)) {
          CherryToast.success(
            title: const Text(
              "+10xp PawMaster",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            toastDuration: const Duration(seconds: 5),
            height: 50,
            animationType: AnimationType.fromTop,
            iconWidget: SvgPicture.asset(
              "assets/badges/pawmapper10plus.svg",
              fit: BoxFit.contain,
              height: 50,
            ),
            onToastClosed: () {
              SessionService.markAsRewarded();
            },
          ).show(context);
        }
      }
    }
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _bottomNavIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Intro(
      controller: introController,
      topLayerBuilder: (context, controller) {
        final progress = controller.currentStep / controller.stepCount;
        return SafeArea(
            child: Column(
          children: [
            Flexible(
              child: FAProgressBar(
                currentValue: (progress * 100),
                progressColor: ColorPalette.primaryColor,
                size: 5,
              ),
            ),
          ],
        ));
      },
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: pageController,
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ProfileScreen(
              introController: introController,
              onBack: () {
                animateToPage(4);
              },
            ),
            PawCountryLeaderBoards(
              isPageMode: true,
              introController: introController,
              onBack: () {
                animateToPage(4);
              },
            ),
            PawCityLeaderBoards(
              isPageMode: true,
              introController: introController,
              onBack: () {
                animateToPage(4);
              },
            ),
            const SearchPage(),
            MapPage(
              onTapSearch: () {
                animateToPage(3);
              },
            ),
          ],
        ),
        floatingActionButton: IntroStepTarget(
          step: 1,
          controller: introController,
          cardDecoration: const IntroCardDecoration(
            showPreviousButton: false,
            showNextButton: false,
            align: IntroCardAlign.outsideTopLeft,
          ),
          onHighlightTap: () {
            var loc = store.currentLocation;
            animateToPage(4);
            showModalBottomSheet(
              context: context,
              builder: (context) => FavoritesPullupSheet(
                places: store.places,
                introController: introController,
                currentLoc: LatLng(loc.latitude, loc.longitude),
              ),
            );
            Future.delayed(const Duration(milliseconds: 500), () {
              introController.next();
            });
          },
          cardContents: const TextSpan(
            text:
                "Tap here to view your favorites,\nand recently reviews places.",
          ),
          child: GestureDetector(
            onTap: () {
              var loc = store.currentLocation;
              animateToPage(4);
              showModalBottomSheet(
                context: context,
                builder: (context) => FavoritesPullupSheet(
                  places: store.places,
                  currentLoc: LatLng(loc.latitude, loc.longitude),
                ),
              );
            },
            child: Container(
              height: 67,
              width: 67,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.lightGreen,
                )
              ]),
              child: SvgPicture.asset(
                "assets/images/paw_center_button.svg",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          shadow: BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
          ),
          tabBuilder: (int index, bool isActive) {
            var buttonColor = (isActive)
                ? ColorPalette.primaryAccentColor
                : ColorPalette.accentText;
            final widget = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  height: 25,
                  iconList[index].icon,
                  // ignore: deprecated_member_use
                  color: buttonColor,
                  fit: BoxFit.contain,
                  theme: SvgTheme(
                    currentColor: buttonColor,
                  ),
                ),
                Text(
                  iconList[index].text,
                  style: TextStyle(
                    fontSize: 10,
                    color: buttonColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );

            if (index == 0) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
                child: IntroStepTarget(
                  step: 3,
                  controller: introController,
                  cardDecoration: const IntroCardDecoration(
                    showPreviousButton: false,
                    showNextButton: false,
                    align: IntroCardAlign.outsideTopLeft,
                  ),
                  onHighlightTap: () {
                    animateToPage(0);
                    Future.delayed(const Duration(milliseconds: 500), () {
                      introController.next();
                    });
                  },
                  cardContents: const TextSpan(
                    text: "Tap here to access your profile",
                  ),
                  child: widget,
                ),
              );
            }

            if (index == 1) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                child: IntroStepTarget(
                  step: 8,
                  controller: introController,
                  cardDecoration: const IntroCardDecoration(
                    showPreviousButton: false,
                    showNextButton: false,
                    align: IntroCardAlign.outsideTopLeft,
                  ),
                  onHighlightTap: () {
                    animateToPage(1);
                    Future.delayed(const Duration(milliseconds: 500), () {
                      introController.next();
                    });
                  },
                  cardContents: const TextSpan(
                    text: "Tap here to see nation wide rankings",
                  ),
                  child: widget,
                ),
              );
            }

            if (index == 2) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
                child: IntroStepTarget(
                  step: 10,
                  controller: introController,
                  cardDecoration: const IntroCardDecoration(
                    showPreviousButton: false,
                    showNextButton: false,
                    align: IntroCardAlign.outsideTopLeft,
                  ),
                  onHighlightTap: () {
                    animateToPage(2);
                    Future.delayed(const Duration(milliseconds: 500), () {
                      introController.next();
                    });
                  },
                  cardContents: const TextSpan(
                    text: "Tap here to see \ncity wide rankings",
                  ),
                  child: widget,
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 17),
              child: widget,
            );
          },
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          height: 75,
          onTap: (index) {
            if (index == _bottomNavIndex) {
              animateToPage(4);
            } else {
              switch (index) {
                case 0:
                  final hasSession = dpLocator<SessionStore>().hasSession;
                  final hasProfile = dpLocator<SessionStore>().hasProfile;
                  if (hasSession) {
                    if (hasProfile) {
                      animateToPage(index);
                    } else {
                      context.goNamed(Register.routeName);
                    }
                  } else {
                    context.goNamed(LoginWithPhone.routeName);
                  }
                  break;
                // case 1:
                //   Fluttertoast.showToast(
                //       msg: "Feature coming soon",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.BOTTOM,
                //       timeInSecForIosWeb: 1,
                //       backgroundColor: Colors.white,
                //       textColor: Colors.black,
                //       fontSize: 16.0);
                //   break;

                // case 3:
                //   Fluttertoast.showToast(
                //       msg: "Feature coming soon",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.BOTTOM,
                //       timeInSecForIosWeb: 1,
                //       backgroundColor: Colors.white,
                //       textColor: Colors.black,
                //       fontSize: 16.0);
                //   break;
                default:
                  animateToPage(index);
              }
            }
          },
          //other params
        ),
      ),
    );
  }
}
