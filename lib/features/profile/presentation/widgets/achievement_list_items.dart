import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class AchievementListItem extends StatelessWidget {
  const AchievementListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/badges/pawmapper10plus.svg"),
        const Gap(15),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Paw Mapper Badge",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const Gap(5),
            Row(
              children: [
                Flexible(
                  child: LinearProgressIndicator(
                    color: ColorPalette.primaryColor,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(10),
                    value: .5,
                  ),
                ),
                const Gap(15),
                Text(
                  "1/10",
                  style: TextStyle(
                    color: ColorPalette.accentText,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}
