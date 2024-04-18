import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intro/intro.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_explorer_explainer/explorer_badge_dialog_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_mapper_explainer/mapper_badge_dialog_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_reviewer_explainer/reviewer_badge_dialog_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_sharer_explainer/sharer_badge_dialog_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_city_leaderboard_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_country_leaderboard_screen.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/profile_comments_page.dart';
import 'package:pawplaces/features/profile/data/models/user_model.dart';
import 'package:pawplaces/features/profile/presentation/screens/add_pet_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/edit_profile_info.dart';
import 'package:pawplaces/features/profile/presentation/screens/pet_details_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_discovered.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_visited.dart';
import 'package:pawplaces/features/profile/presentation/stores/edit_profile_store.dart';
import 'package:pawplaces/features/profile/presentation/stores/profile_store.dart';
import 'package:pawplaces/features/profile/presentation/widgets/achievement_list_items.dart';
import 'package:pawplaces/features/setting_page/presentation/screens/settings_screen.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "ProfileScreen";
  static String route = "ProfileScreen";
  final IntroController? introController;
  final void Function()? onBack;
  const ProfileScreen({super.key, this.onBack, this.introController});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final store = dpLocator<ProfileStore>();
  final scrollController = DraggableScrollableController();

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
                  final child = SizedBox(
                    height: 180,
                    child: Row(
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
                            const Spacer(),
                            SizedBox(
                              height: 100,
                              child: GestureDetector(
                                onTap: () {
                                  if (store.hasPet) {
                                    context.goNamed(
                                      PetDetailsScreen.routeName,
                                      extra: firstPet,
                                    );
                                  }
                                },
                                child: AspectRatio(
                                  aspectRatio: 158 / 96,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color:
                                                ColorPalette.primaryColorLight,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(14.5),
                                            child: Image.network(
                                              "${firstPet?.petPhotoUrl}",
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, e, _) =>
                                                  Image.asset(
                                                "assets/images/pet_silhouette.png",
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
                                            context.goNamed(
                                                AddPetScreen.routeName);
                                          },
                                          child: Observer(builder: (context) {
                                            if (!store.hasPet) {
                                              return GestureDetector(
                                                onTap: () {
                                                  context.goNamed(
                                                      AddPetScreen.routeName);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: SvgPicture.asset(
                                                    "assets/icons/add_icon.svg",
                                                    height: 25,
                                                  ),
                                                ),
                                              );
                                            }

                                            return PopupMenuButton<String>(
                                              onSelected: (selected) {
                                                switch (selected) {
                                                  case 'Add pet':
                                                    context.goNamed(
                                                        AddPetScreen.routeName);
                                                    break;
                                                  case 'Pet details':
                                                    context.goNamed(
                                                      PetDetailsScreen
                                                          .routeName,
                                                      extra: firstPet,
                                                    );
                                                    break;
                                                }
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return {
                                                  'Add pet',
                                                  'Pet details'
                                                }.map((String choice) {
                                                  return PopupMenuItem<String>(
                                                    height: 40,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 15,
                                                    ),
                                                    value: choice,
                                                    child: Text(
                                                      choice,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  );
                                                }).toList();
                                              },
                                              child: const Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(5),
                          ],
                        ),
                        const Gap(10),
                        widget.introController != null
                            ? SizedBox(
                                height: 170,
                                child: IntroStepTarget(
                                  step: 4,
                                  controller: widget.introController!,
                                  cardDecoration: const IntroCardDecoration(
                                    showPreviousButton: false,
                                    showNextButton: true,
                                    align: IntroCardAlign.outsideLeftTop,
                                  ),
                                  cardContents: const TextSpan(
                                    text:
                                        "Tap here to update \nyour profile picture.",
                                  ),
                                  child: _buildProfilePicture(profile),
                                ),
                              )
                            : _buildProfilePicture(profile),
                        const Gap(20),
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
                  const Row(
                    children: [
                      Gap(20),
                      Text(
                        "PawsPorts",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Spacer(),
                      // Text(
                      //   "view all",
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w400,
                      //     color: ColorPalette.linkText,
                      //   ),
                      // ),
                      // const Gap(15),
                    ],
                  ),
                  const Gap(15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Observer(builder: (context) {
                        final pets = store.user?.petProfiles ?? [];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(pets.length, (index) {
                              final pet = pets[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    context.goNamed(
                                      PetDetailsScreen.routeName,
                                      extra: pet,
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Image.network(
                                          "${pet.petPhotoUrl}",
                                          height: 50,
                                          fit: BoxFit.contain,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            "assets/images/animal1.png",
                                            height: 60,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        pet.petName ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: ColorPalette.accentTextDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        );
                      }),
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
              final startDate = store.user?.userStartDate;

              var actionButtons = Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ProfileActionCard(
                          title: "Start Date",
                          subTitle: startDate != null
                              ? DateFormat('MMM d, yyyy').format(startDate)
                              : "Just Started",
                          isSVG: false,
                          imageAsset: "assets/icons/start_icon.png",
                        ),
                      ),
                      const Gap(10),
                      Flexible(
                        child: IntroStepTarget(
                          step: 5,
                          controller: widget.introController!,
                          cardDecoration: const IntroCardDecoration(
                            showPreviousButton: false,
                            showNextButton: true,
                            align: IntroCardAlign.outsideLeftTop,
                          ),
                          cardContents: const TextSpan(
                            text:
                                "Here,\nyou can see the palaces \nyou recently visited.",
                          ),
                          child: ProfileActionCard(
                            title: "Places Visited",
                            subTitle:
                                "${profile?.noOfPlaceVisits ?? 0} Visited",
                            onTap: () {
                              context.goNamed(PlacesVisited.routeName);
                            },
                            imageAsset: "assets/icons/visited_icon.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: IntroStepTarget(
                          step: 6,
                          controller: widget.introController!,
                          onStepWillDeactivate: (willToStep) async {
                            await scrollController.animateTo(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            // Future.delayed(const Duration(seconds: 1),
                            //     () async {
                            //   widget.introController?.refresh();
                            // });
                          },
                          cardDecoration: const IntroCardDecoration(
                            showPreviousButton: false,
                            showNextButton: true,
                            align: IntroCardAlign.outsideRightTop,
                          ),
                          cardContents: const TextSpan(
                            text:
                                "Here,\nyou can see the palaces \nyou recently discovered.",
                          ),
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
                      ),
                      const Gap(10),
                      Flexible(
                        child: ProfileActionCard(
                          title: "Reviewed Places",
                          subTitle: "0 total",
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ProfileCommentsPage(
                                      user: store.user,
                                      isOwnProfile: true,
                                    ));
                          },
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
                      const Gap(10),
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
                    ],
                  ),
                ],
              );

              return DraggableScrollableSheet(
                  initialChildSize: initialSize,
                  minChildSize: initialSize,
                  controller: scrollController,
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
                                IntroStepTarget(
                                  step: 7,
                                  controller: widget.introController!,
                                  onStepWillActivate: (fromStep) {},
                                  cardDecoration: const IntroCardDecoration(
                                    showPreviousButton: false,
                                    showNextButton: true,
                                    align: IntroCardAlign.outsideTopRight,
                                  ),
                                  cardContents: const TextSpan(
                                    text:
                                        "Your badges and achievements will be listed here.",
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: ColorPalette.accentText
                                            .withOpacity(.5),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        const Gap(20),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: GestureDetector(
                                              onTap: () {
                                                context.pushNamed(
                                                  MapperBadgeDialogScreen
                                                      .routeName,
                                                );
                                              },
                                              child: const AchievementListItem(
                                                icon:
                                                    "assets/badges/pawmapper10plus.svg",
                                                tittle: 'Paw Mapper Badge',
                                                isSvg: true,
                                              )),
                                        ),
                                        const Gap(15),
                                        const Divider(
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        const Gap(15),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: GestureDetector(
                                              onTap: () {
                                                context.pushNamed(
                                                  ExplorerBadgeDialogScreen
                                                      .routeName,
                                                );
                                              },
                                              child: const AchievementListItem(
                                                icon:
                                                    "assets/badges/plus_20_orange.png",
                                                tittle: 'Paw Explorer Badge',
                                                isSvg: false,
                                              )),
                                        ),
                                        const Gap(15),
                                        const Divider(
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        const Gap(15),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: GestureDetector(
                                              onTap: () {
                                                context.pushNamed(
                                                  ReviewerReviewerBadgeDialogScreen
                                                      .routeName,
                                                );
                                              },
                                              child: const AchievementListItem(
                                                icon:
                                                    "assets/badges/pawreviewerBadge.png",
                                                tittle: 'Reviewer Badge',
                                                isSvg: false,
                                              )),
                                        ),
                                        const Gap(15),
                                        const Divider(
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        const Gap(15),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: GestureDetector(
                                              onTap: () {
                                                context.pushNamed(
                                                  SharerSharerBadgeDialogScreen
                                                      .routeName,
                                                );
                                              },
                                              child: const AchievementListItem(
                                                icon:
                                                    "assets/badges/sharerBadge.png",
                                                tittle: 'Sharer Badge',
                                                isSvg: false,
                                              )),
                                        ),
                                        const Gap(20),
                                      ],
                                    ),
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

  GestureDetector _buildProfilePicture(UserModel? profile) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();

        // ignore: unused_local_variable
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatio: const CropAspectRatio(
              ratioX: 500,
              ratioY: 500,
            ),
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                toolbarColor: ColorPalette.primaryColorDark,
                toolbarWidgetColor: ColorPalette.secondaryAccentColor,
                activeControlsWidgetColor: ColorPalette.primaryColorDark,
                hideBottomControls: true,
                lockAspectRatio: true,
              ),
              IOSUiSettings(
                title: 'Crop Image',
                aspectRatioLockEnabled: true,
                resetButtonHidden: true,
                rotateButtonsHidden: true,
                rotateClockwiseButtonHidden: true,
                aspectRatioPickerButtonHidden: true,
              ),
            ],
          );

          if (croppedFile != null) {
            final editProfileStore = EditProfileStore();
            await editProfileStore.setPicture(XFile(croppedFile.path));
            store.getProfileDetails();
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: ColorPalette.primaryColorLight,
            borderRadius: BorderRadius.circular(21),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "${profile?.userPhotoUrl}",
              fit: BoxFit.cover,
              errorBuilder: (context, e, _) => Image.asset(
                "assets/icons/profilePicPlaceHolder.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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
