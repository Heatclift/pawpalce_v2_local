import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/dashboard/presentation/dashboard_modal_triggers.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/image_view_dialog.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  DashboardModalTriggers.showprofileComments(context);
                },
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/images/Jhon.png"),
                ),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "John M.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 12,
                        child: Image.asset(
                          "assets/images/5pawRate.png",
                        ),
                      ),
                      const Gap(5),
                      Text(
                        "● 2 days ago",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.accentText.withOpacity(.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const Gap(10),
          const Text(
            "I had an excellent experience with this pet shop! The staff was incredibly friendly and they helped me find the perfect products for my furry friends. The store was clean recommend!",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const Gap(10),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierColor: const Color.fromRGBO(24, 24, 24, 1),
                        builder: (context) => ImageViewDialog());
                  },
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://loremflickr.com/400/400",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://loremflickr.com/400/400",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(15),
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://loremflickr.com/400/400",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
