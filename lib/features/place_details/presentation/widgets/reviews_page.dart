import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/place_details/presentation/screens/review_screen.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/comment_card.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/facilities_chip.dart';
import 'package:pawplaces/main.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FacilitiesChip(
                  label: "Indoor",
                  count: 520,
                ),
                FacilitiesChip(
                  label: "Outdoor",
                  count: 753,
                ),
                FacilitiesChip(
                  label: "Both",
                  count: 1272,
                ),
              ],
            ),
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
                          const Text(
                            "4.7",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 35,
                            ),
                          ),
                          Text(
                            "out of 5",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ColorPalette.secondaryText.withOpacity(.5),
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
                          height: 15,
                          child: Image.asset(
                            "assets/images/5pawRate.png",
                          ),
                        ),
                        const Gap(10),
                        const Text(
                          "(235)",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        const Gap(10),
                      ],
                    ),
                    const Gap(5),
                    Text(
                      "Pet-Friendly",
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
                        const Text(
                          "(35)",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
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
                  Navigator.of(context).pop();
                  router.goNamed(ReviewScreen.routeName);
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
          const Row(
            children: [
              Gap(15),
              Text(
                "121 reviews",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Gap(15),
              Text(
                "View all",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(29, 128, 219, 1),
                  decoration: TextDecoration.underline,
                  fontSize: 13,
                ),
              ),
              Gap(15),
            ],
          ),
          const Gap(20),
          const CommentCard(),
          const Gap(15),
          const CommentCard(),
          const Gap(15),
          const CommentCard(),
          const Gap(15),
          const CommentCard(),
          const Gap(15),
          const CommentCard(),
          const Gap(15),
          const CommentCard(),
          const Gap(15),
          const CommentCard(),
          const Gap(15),
          const CommentCard(),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: double.maxFinite,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: ColorPalette.accentText.withOpacity(.5),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  minimumSize: const Size(300, 30),
                ),
                child: Text(
                  "See all 121 reviews",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: ColorPalette.accentText,
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
