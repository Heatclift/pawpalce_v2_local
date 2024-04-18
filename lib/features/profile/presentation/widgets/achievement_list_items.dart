import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class AchievementListItem extends StatelessWidget {
  final String icon;
  final bool isSvg;
  final String tittle;
  const AchievementListItem({
    super.key,
    required this.icon,
    this.isSvg = false,
    required this.tittle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSvg ? SvgPicture.asset(icon) : Image.asset(icon),
        const Gap(15),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tittle,
              style: const TextStyle(
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
                    value: 0,
                  ),
                ),
                const Gap(15),
                Text(
                  "0/10",
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
