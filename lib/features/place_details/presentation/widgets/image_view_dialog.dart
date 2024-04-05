import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/helpers/math_helper.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class ImageViewDialog extends StatelessWidget {
  ImageViewDialog({
    super.key,
  });

  final _cardController = SwipeableCardSectionController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        Row(
          children: [
            const Gap(15),
            const Text(
              "1/4",
              style: TextStyle(
                color: Colors.white,
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
                      border: Border.all(
                        color: Colors.white.withOpacity(.5),
                        width: 1.5,
                      ),
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
            const Gap(15),
          ],
        ),
        const Gap(40),
        SizedBox(
          height: 565,
          child: Column(
            children: [
              SwipeableCardsSection(
                cardController: _cardController,
                context: context,

                //add the first 3 cards (widgets)
                items: List.generate(
                    5,
                    (index) => CardView(
                        imageUrl:
                            "https://loremflickr.com/346/50${MathHelper.randomNumber(1, 9)}")),
                //Get card swipe event callbacks
                onCardSwiped: (dir, index, widget) {
                  //Add the next card using _cardController
                  _cardController.addItem(CardView(
                      imageUrl:
                          "https://loremflickr.com/346/50${MathHelper.randomNumber(1, 9)}"));

                  //Take action on the swiped widget based on the direction of swipe
                  //Return false to not animate cards
                },

                enableSwipeUp: true,
                enableSwipeDown: false,
              ),
            ],
          ),
        ),
        const Gap(40),
        Row(
          children: [
            const Gap(15),
            SizedBox(
              height: 40,
              child: Image.asset("assets/images/Jhon.png"),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "John M.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                  child: Image.asset(
                    "assets/images/5pawRate.png",
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              "2 days ago",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: ColorPalette.accentText.withOpacity(.9),
                fontSize: 13,
              ),
            ),
            const Gap(15),
          ],
        ),
        const Gap(10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "I had an excellent experience with this pet shop! The staff was incredibly friendly and they helped me find the perfect products for my furry friends. The store was clean recommend!",
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 503,
        child: AspectRatio(
          aspectRatio: 346 / 503,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
