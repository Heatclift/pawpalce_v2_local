import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_city_leaderboard_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_country_leaderboard_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/add_pet_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/edit_profile_info.dart';
import 'package:pawplaces/features/profile/presentation/screens/pet_details_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_discovered.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_visited.dart';
import 'package:pawplaces/features/profile/presentation/stores/profile_store.dart';
import 'package:pawplaces/features/profile/presentation/widgets/achievement_list_items.dart';
import 'package:pawplaces/features/setting_page/presentation/screens/settings_screen.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "ProfileScreen";
  static String route = "ProfileScreen";
  final void Function()? onBack;
  const ProfileScreen({super.key, this.onBack});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final store = dpLocator<ProfileStore>();

  @override
  void initState() {
    store.getProfileDetails();

    // Future.delayed(
    //   const Duration(seconds: 1),
    //   () {
    //     _maxChildSize(context);
    //   },
    // );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.restoreSystemUIOverlays();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    ColorPalette.primaryColorDark,
                    ColorPalette.primaryColor
                  ])),
            ),
          ),
          Positioned(
              top: 0,
              child: SvgPicture.asset("assets/images/pawUpsideDown.svg")),
          Positioned.fill(
            child: Column(
              children: [
                const Gap(60),
                Row(
                  children: [
                    const Gap(15),
                    GestureDetector(
                      onTap: () {
                        widget.onBack?.call();
                      },
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorPalette.primaryColorLight,
                            ),
                            child: const Icon(
                              Icons.chevron_left,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    const Text(
                      "Pawfile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(EditProfileInfoScreen.routeName);
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
                              color: ColorPalette.primaryColorLight,
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(SettingsScreen.routeName);
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
                              color: ColorPalette.primaryColorLight,
                            ),
                            child: const Icon(
                              Icons.settings_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                  ],
                ),
                const Gap(20),
                Observer(builder: (context) {
                  final profile = store.user;
                  final petProfiles = profile?.petProfiles;
                  final firstPet = (petProfiles?.isNotEmpty ?? false
                      ? petProfiles?.first
                      : null);
                  final child = Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${profile?.firstName} ${profile?.lastName}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                          if (firstPet != null)
                            Row(
                              children: [
                                Text(
                                  "& ${firstPet.petName}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                                const Gap(5),
                                SvgPicture.asset(
                                  "assets/icons/vip_badge.svg",
                                )
                              ],
                            ),
                          const Gap(10),
                          SizedBox(
                            height: 100,
                            child: AspectRatio(
                              aspectRatio: 158 / 96,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: ColorPalette.primaryColorLight,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.5),
                                        child: Image.network(
                                          "${firstPet?.petPhotoUrl}",
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, e, _) =>
                                              Image.network(
                                            "https://loremflickr.com/158/96",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () {
                                        context.goNamed(AddPetScreen.routeName);
                                      },
                                      child: PopupMenuButton<String>(
                                        onSelected: (selected) {
                                          switch (selected) {
                                            case 'Add pet':
                                              context.goNamed(
                                                  AddPetScreen.routeName);
                                              break;
                                            case 'Pet details':
                                              context.goNamed(
                                                  PetDetailsScreen.routeName);
                                              break;
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        itemBuilder: (BuildContext context) {
                                          return {'Add pet', 'Pet details'}
                                              .map((String choice) {
                                            return PopupMenuItem<String>(
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              value: choice,
                                              child: Text(
                                                choice,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            );
                                          }).toList();
                                        },
                                        child: const Icon(
                                          Icons.more_horiz,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      SizedBox(
                        height: 170,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: ColorPalette.primaryColorLight,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14.5),
                              child: Image.network(
                                "${profile?.userPhotoUrl}",
                                fit: BoxFit.cover,
                                errorBuilder: (context, e, _) => Image.network(
                                  "https://loremflickr.com/158/158",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                    ],
                  );

                  if (store.isLoading) {
                    return Shimmer.fromColors(
                      baseColor: ColorPalette.secondaryAccentColor,
                      highlightColor: ColorPalette.silver,
                      child: child,
                    );
                  }

                  return child;
                }),
              ],
            ),
          ),
          Observer(builder: (context) {
            final hasMorePets = (store.user?.petProfiles?.length ?? 0) > 1;

            if (!hasMorePets) {
              return const SizedBox.shrink();
            }

            final child = Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Gap(20),
                      const Text(
                        "PawsPorts",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "view all",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.linkText,
                        ),
                      ),
                      const Gap(15),
                    ],
                  ),
                  const Gap(15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.goNamed(PetDetailsScreen.routeName);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/animal1.png",
                                  height: 60,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  "Sadie",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: ColorPalette.accentTextDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/animal2.png",
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                "Luna",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: ColorPalette.accentTextDark,
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/animal1.png",
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                "Maxx",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: ColorPalette.accentTextDark,
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/animal3.png",
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                "Milo",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: ColorPalette.accentTextDark,
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/animal1.png",
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                "Maomao",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: ColorPalette.accentTextDark,
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );

            if (store.isLoading) {
              return Shimmer.fromColors(
                baseColor: ColorPalette.secondaryAccentColor,
                highlightColor: ColorPalette.silver,
                child: child,
              );
            }

            return Positioned(
              top: 310,
              left: 20,
              right: 20,
              child: child,
            );
          }),
          Positioned.fill(
            child: Observer(builder: (context) {
              final profile = store.user;
              final hasMorePets = (profile?.petProfiles?.length ?? 0) > 1;
              final initialSize = hasMorePets ? (1 / 2.159) : (1 / 1.57);

              final isLoading = store.isLoading;

              var actionButtons = Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: ProfileActionCard(
                          title: "Start Date",
                          subTitle: "January 1, 2024",
                          isSVG: false,
                          imageAsset: "assets/icons/start_icon.png",
                        ),
                      ),
                      const Gap(10),
                      Flexible(
                        child: ProfileActionCard(
                          title: "Places Visited",
                          subTitle: "${profile?.noOfPlaceVisits ?? 0} Visited",
                          onTap: () {
                            context.goNamed(PlacesVisited.routeName);
                          },
                          imageAsset: "assets/icons/visited_icon.svg",
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ProfileActionCard(
                          title: "Discovered",
                          subTitle:
                              "${profile?.noOfDiscoveredPlaces ?? 0} New places",
                          onTap: () {
                            context.goNamed(PlacesDiscovered.routeName);
                          },
                          imageAsset: "assets/icons/discovered_icon.svg",
                        ),
                      ),
                      const Gap(10),
                      Flexible(
                        child: ProfileActionCard(
                          title: "Distance Walked",
                          subTitle:
                              "${profile?.noOfDistanceWalked ?? 0} km total",
                          imageAsset: "assets/icons/walked_icon.svg",
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ProfileLeaderBoardsCard(
                          title: "Paw City",
                          subTitle: "Leaderboard",
                          onTap: () {
                            context.goNamed(PawCityLeaderBoards.routeName);
                          },
                          color: const Color.fromRGBO(101, 107, 255, 1),
                          isSVG: false,
                          imageAsset: "assets/icons/next_purple.png",
                        ),
                      ),
                      const Gap(10),
                      Flexible(
                        child: ProfileLeaderBoardsCard(
                          title: "Paw Country",
                          subTitle: "Leaderboard",
                          onTap: () {
                            context.goNamed(PawCountryLeaderBoards.routeName);
                          },
                          color: const Color.fromRGBO(255, 129, 81, 1),
                          imageAsset: "assets/icons/next_orange.png",
                          isSVG: false,
                        ),
                      ),
                    ],
                  ),
                ],
              );

              return DraggableScrollableSheet(
                  initialChildSize: initialSize,
                  minChildSize: initialSize,
                  maxChildSize: 1,
                  expand: false,
                  snap: true,
                  snapSizes: [initialSize, 1],
                  builder: (
                    BuildContext context,
                    ScrollController scrollController,
                  ) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ListView(
                              controller: scrollController,
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 15,
                                right: 15,
                                bottom: 120,
                              ),
                              children: [
                                if (isLoading)
                                  Shimmer.fromColors(
                                    baseColor:
                                        ColorPalette.secondaryAccentColor,
                                    highlightColor: ColorPalette.silver,
                                    child: actionButtons,
                                  ),
                                if (!isLoading) actionButtons,
                                const Gap(30),
                                const Row(
                                  children: [
                                    Text(
                                      "Badges achievements",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(15),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: ColorPalette.accentText
                                          .withOpacity(.5),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Column(
                                    children: [
                                      Gap(20),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AchievementListItem(),
                                      ),
                                      Gap(15),
                                      Divider(
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                      Gap(15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AchievementListItem(),
                                      ),
                                      Gap(15),
                                      Divider(
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                      Gap(15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AchievementListItem(),
                                      ),
                                      Gap(15),
                                      Divider(
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                      Gap(15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AchievementListItem(),
                                      ),
                                      Gap(15),
                                      Divider(
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                      Gap(15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AchievementListItem(),
                                      ),
                                      Gap(15),
                                      Divider(
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                      Gap(15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AchievementListItem(),
                                      ),
                                      Gap(20),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          IgnorePointer(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: SvgPicture.asset(
                                    "assets/icons/handle_bar.svg",
                                    width: 50,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}

class ProfileLeaderBoardsCard extends StatelessWidget {
  const ProfileLeaderBoardsCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subTitle,
    this.isSVG = true,
    this.size = 35,
    this.color = Colors.green,
    this.onTap,
  });
  final void Function()? onTap;
  final String imageAsset;

  final String title;
  final String subTitle;
  final bool isSVG;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.black.withOpacity(.15),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(.8),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            if (isSVG)
              SvgPicture.asset(
                imageAsset,
                fit: BoxFit.contain,
                height: size,
              ),
            if (!isSVG)
              Image.asset(
                imageAsset,
                fit: BoxFit.contain,
                height: size,
              ),
          ],
        ),
      ),
    );
  }
}

class ProfileActionCard extends StatelessWidget {
  const ProfileActionCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subTitle,
    this.isSVG = true,
    this.size = 40,
    this.onTap,
  });

  final void Function()? onTap;

  final String imageAsset;

  final String title;
  final String subTitle;
  final bool isSVG;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.black.withOpacity(.15),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorPalette.accentText,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            if (isSVG)
              SvgPicture.asset(
                imageAsset,
                fit: BoxFit.contain,
                height: size,
                width: size,
              ),
            if (!isSVG)
              Image.asset(
                imageAsset,
                fit: BoxFit.contain,
                height: size,
                width: size,
              ),
          ],
        ),
      ),
    );
  }
}
