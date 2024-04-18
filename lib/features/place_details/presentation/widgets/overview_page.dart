import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/common/presentation/widgets/rating_bar.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/login/presentation/screens/login_with_phone_screen.dart';
import 'package:pawplaces/features/place_details/presentation/screens/review_screen.dart';
import 'package:pawplaces/features/place_details/presentation/stores/place_details_store.dart';
import 'package:pawplaces/features/place_details/presentation/stores/place_reviews_store.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/comment_card.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/facilities_chip.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/highlights_container.dart';
import 'package:pawplaces/features/register/presentation/screens/register_screen.dart';
import 'package:pawplaces/main.dart';

class OverviewPage extends StatefulWidget {
  final PlaceDetailsStore placeStore;
  const OverviewPage({
    super.key,
    required this.place,
    required this.placeStore,
  });

  final PlaceModel place;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final reviewsStore = dpLocator<PlaceReviewsStore>();
  @override
  void initState() {
    reviewsStore.setupReactions(context);
    reviewsStore.getPlaceReviews(widget.place.placeId);
    super.initState();
  }

  @override
  void dispose() {
    reviewsStore.disposeReactions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(builder: (context) {
        final reviews = reviewsStore.reviews;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Observer(builder: (context) {
                final placeDetails = widget.placeStore.placeDetails;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FacilitiesChip(
                      label: "Indoor",
                      count: placeDetails?.indoorVotes ?? 0,
                    ),
                    FacilitiesChip(
                      label: "Outdoor",
                      count: placeDetails?.outdoorVotes ?? 0,
                    ),
                    FacilitiesChip(
                      label: "Both",
                      count: placeDetails?.bothVotes ?? 0,
                    ),
                  ],
                );
              }),
            ),
            const Gap(30),
            const Row(
              children: [
                Gap(15),
                Text(
                  "About",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.place.placeDescription ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: ColorPalette.secondaryText,
                  fontSize: 14,
                ),
              ),
            ),
            const Gap(20),
            const Row(
              children: [
                Gap(15),
                Text(
                  "Highlight",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Gap(12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: HighlightsContainer(
                text:
                    "Accessible restrooms equipped with grab bars and ample space.",
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: HighlightsContainer(
                text: "Clear pathways and wide aisles for easy navigation.",
              ),
            ),
            const Gap(20),
            Divider(
              color: ColorPalette.accentText.withOpacity(.4),
            ),
            const Gap(20),
            const Row(
              children: [
                Gap(15),
                Text(
                  "Review summary",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Over all",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.secondaryText,
                          fontSize: 17,
                        ),
                      ),
                      const Gap(5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: ColorPalette.accentText.withOpacity(.5),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Observer(builder: (context) {
                              return Text(
                                reviewsStore.rateAvg.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                ),
                              );
                            }),
                            Text(
                              "out of 5",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color:
                                    ColorPalette.secondaryText.withOpacity(.5),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Rating",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.secondaryText,
                          fontSize: 17,
                        ),
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            child: FittedBox(
                              child: Observer(builder: (context) {
                                return CustomRatingBar(
                                  value: reviewsStore.rateAvg,
                                  readOnly: true,
                                );
                              }),
                            ),
                          ),
                          const Gap(10),
                          Text(
                            "(${reviewsStore.reviews.length})",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                      const Gap(5),
                      Text(
                        "Not Pet-Friendly",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.secondaryText,
                          fontSize: 17,
                        ),
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          SizedBox(
                            height: 15,
                            child: Image.asset(
                              "assets/icons/dogIcon.png",
                            ),
                          ),
                          const Gap(10),
                          Observer(builder: (context) {
                            return Text(
                              "(${reviewsStore.notePetFrenCount})",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            );
                          }),
                          const Gap(10),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {
                    final hasSession = dpLocator<SessionStore>().hasSession;
                    final hasProfile = dpLocator<SessionStore>().hasProfile;
                    if (hasSession) {
                      if (hasProfile) {
                        Navigator.of(context).pop();
                        router.goNamed(ReviewScreen.routeName,
                            extra: widget.place);
                      } else {
                        context.goNamed(Register.routeName);
                      }
                    } else {
                      context.goNamed(LoginWithPhone.routeName);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    minimumSize: const Size(300, 50),
                  ),
                  child: const Text(
                    "Write a review",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(20),
            Divider(
              color: ColorPalette.accentText.withOpacity(.4),
            ),
            const Gap(20),
            Row(
              children: [
                const Gap(15),
                Text(
                  "${reviews.length} reviews",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                const Gap(15),
                // const Text(
                //   "View all",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w400,
                //     color: Color.fromRGBO(29, 128, 219, 1),
                //     decoration: TextDecoration.underline,
                //     fontSize: 13,
                //   ),
                // ),
                const Gap(15),
              ],
            ),
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: SizedBox(
            //     width: double.maxFinite,
            //     child: TextButton(
            //       onPressed: () {},
            //       style: TextButton.styleFrom(
            //         backgroundColor: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           side: BorderSide(
            //             color: ColorPalette.accentText.withOpacity(.5),
            //             width: 1,
            //           ),
            //           borderRadius: const BorderRadius.all(
            //             Radius.circular(15),
            //           ),
            //         ),
            //         minimumSize: const Size(300, 30),
            //       ),
            //       child: Text(
            //         "See all 121 reviews",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 16,
            //           color: ColorPalette.accentText,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const Gap(20),
          ],
        );
      }),
    );
  }
}
