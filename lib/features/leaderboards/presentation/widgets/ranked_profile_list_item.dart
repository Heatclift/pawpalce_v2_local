import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class RankedProfileListItem extends StatelessWidget {
  const RankedProfileListItem({
    super.key,
    required this.rank,
    required this.photoUrl,
    required this.title,
    required this.subtitle,
    required this.xp,
  });

  final int rank;
  final String photoUrl;
  final String title;
  final String subtitle;
  final int xp;

  Widget rankBadge() {
    switch (rank) {
      case 1:
        return SvgPicture.asset("assets/icons/leaderboard_gold.svg");
      case 2:
        return SvgPicture.asset("assets/icons/leaderboard_silver.svg");
      case 3:
        return SvgPicture.asset("assets/icons/leaderboard_bronze.svg");
      default:
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorPalette.accentText.withOpacity(.5),
            ),
          ),
          child: Center(
            child: Text(
              "$rank",
              style: TextStyle(
                color: ColorPalette.accentText,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: ColorPalette.accentText.withOpacity(.4),
      ))),
      child: Row(
        children: [
          rankBadge(),
          const Gap(10),
          CircleAvatar(
            radius: 22,
            backgroundImage: Image.network(
              photoUrl,
              fit: BoxFit.contain,
              height: 50,
            ).image,
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              )
            ],
          ),
          const Spacer(),
          if (rank > 1)
            Text(
              "$xp XP",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: ColorPalette.ashColor,
              ),
            ),
          if (rank <= 1)
            GradientAnimationText(
              text: Text(
                "$xp XP",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              transform: const GradientRotation(20),
              colors: [
                ColorPalette.orange,
                ColorPalette.orangeLght,
                ColorPalette.orange,
              ],
              duration: const Duration(seconds: 2),
            )
        ],
      ),
    );
  }
}
