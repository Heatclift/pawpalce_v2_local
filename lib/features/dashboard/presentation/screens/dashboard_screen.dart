import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/presentation/dashboard_modal_triggers.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/pages/map_page.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/pages/paw_market_coming_soon.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/pages/paw_support_coming_soon.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/favorites_pullup.dart';
import 'package:pawplaces/features/login/presentation/screens/login_with_phone_screen.dart';

import 'package:pawplaces/features/profile/presentation/screens/profile_screen.dart';
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
  late PageController pageController;

  final iconList = [
    (icon: "assets/images/profile.svg", text: "Pawfile"),
    (icon: "assets/images/pawpath.svg", text: "PawMarket"),
    (icon: "assets/images/search.svg", text: "Search"),
    (icon: "assets/images/support.svg", text: "PawSupport"),
  ];

  void inti() {
    if (widget.params != null) {
      var params = widget.params;
      if (params?.containsKey("commentProfile") ?? false) {
        if (mounted) {
          DashboardModalTriggers.showprofileComments(context);
        }
      }
      if (params?.containsKey("pawplace") ?? false) {
        if (mounted) {
          DashboardModalTriggers.showpPlaceDetails(context);
        }
      }
    }
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 4);
    inti();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ProfileScreen(
            onBack: () {
              animateToPage(4);
            },
          ),
          const PawmarketComingSoon(),
          const SearchPage(),
          const PawSupportComingSoon(),
          MapPage(
            onTapSearch: () {
              animateToPage(2);
            },
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          var loc = store.currentLocation;
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
          decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
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
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
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
            ),
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
                var hasSession = dpLocator<SessionStore>().hasSession;
                if (hasSession) {
                  animateToPage(index);
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
    );
  }
}
