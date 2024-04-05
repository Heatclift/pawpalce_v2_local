import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class CountryListItem extends StatelessWidget {
  const CountryListItem({
    super.key,
    this.isSelected = false,
    required this.country,
  });

  final bool isSelected;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: isSelected ? ColorPalette.orange : ColorPalette.grey,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CircleFlag(
          country,
          size: 40,
        ),
      ),
    );
  }
}
