import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ColorPalette.accentText.withOpacity(.5),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        minimumSize: const Size(30, 30),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/sort.svg",
            height: 15,
          ),
          const Gap(10),
          Text(
            "Sort",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: ColorPalette.accentTextDark,
            ),
          ),
        ],
      ),
    );
  }
}
