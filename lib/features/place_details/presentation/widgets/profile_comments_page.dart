import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
import 'package:pawplaces/features/place_details/presentation/stores/place_reviews_store.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/comment_card.dart';
import 'package:pawplaces/features/profile/data/models/user_model.dart';

class ProfileCommentsPage extends StatefulWidget {
  final UserModel? user;
  final bool isOwnProfile;
  const ProfileCommentsPage({
    super.key,
    this.user,
    this.isOwnProfile = false,
  });

  @override
  State<ProfileCommentsPage> createState() => _ProfileCommentsPageState();
}

class _ProfileCommentsPageState extends State<ProfileCommentsPage>
    with SingleTickerProviderStateMixin {
  final reviewsStore = dpLocator<PlaceReviewsStore>();
  final dashboardStore = dpLocator<DashboardStore>();

  Future<void> init() async {
    if (widget.isOwnProfile) {
      final session = await SessionService.getSession();
      reviewsStore.getUserReviews(session!.localId!);
    }
    // else {
    //   reviewsStore.getUserReviews(widget.user.!);
    // }
  }

  @override
  void initState() {
    reviewsStore.setupReactions(context);
    init();
    super.initState();
  }

  @override
  void dispose() {
    reviewsStore.disposeReactions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(243, 240, 255, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  )),
              child: Column(
                children: [
                  const Gap(20),
                  Row(
                    children: [
                      const Gap(15),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 35,
                        ),
                      ),
                      Text(
                        widget.isOwnProfile ? "My Reviews" : "Profile",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      // IconButton(
                      //   onPressed: () {
                      //     Share.share(
                      //       'Check out John on PawPlaces: https://pawplaces.app/Dashboard?commentProfile=101',
                      //       subject: "Check out John on PawPlaces",
                      //     );
                      //   },
                      //   icon: SvgPicture.asset(
                      //     "assets/icons/share.svg",
                      //     height: 20,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.more_vert,
                      //     size: 27,
                      //   ),
                      // ),
                      const Gap(15),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      const Gap(30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          height: 70,
                          child: Image.network(
                            "${widget.user?.userPhotoUrl}",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.network(
                              "https://fakeimg.pl/60x60?text=No+Image",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.user?.firstName} ${widget.user?.lastName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          const Gap(5),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          child: SvgPicture.asset(
                                              "assets/icons/paw.svg"),
                                        ),
                                        const Gap(5),
                                        Observer(builder: (context) {
                                          return Text(
                                            "${reviewsStore.reviews.length}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                    Text(
                                      "Total reviews",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ColorPalette.secondaryText,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                // VerticalDivider(
                                //   width: 20,
                                //   thickness: 1,
                                //   color: Colors.black.withOpacity(.5),
                                // ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     const Text(
                                //       "45",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.w500,
                                //         fontSize: 15,
                                //       ),
                                //     ),
                                //     Text(
                                //       "Favorites",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.w400,
                                //         color: ColorPalette.secondaryText,
                                //         fontSize: 12,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Observer(builder: (context) {
                final reviews = reviewsStore.reviews;
                return Column(
                  children: [
                    const Gap(20),
                    const Row(
                      children: [
                        Gap(15),
                        Text(
                          "Reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Gap(5),
                        // Text(
                        //   "(80% are Pet-Friendly)",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 12,
                        //   ),
                        // ),
                      ],
                    ),
                    const Gap(20),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 15),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       FacilitiesChip(
                    //         label: "Indoor",
                    //         count: 520,
                    //       ),
                    //       FacilitiesChip(
                    //         label: "Outdoor",
                    //         count: 753,
                    //       ),
                    //       FacilitiesChip(
                    //         label: "Both",
                    //         count: 1272,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const Gap(20),
                    ...reviews.map(
                      (element) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CommentCard(
                            review: element,
                          ),
                        );
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
