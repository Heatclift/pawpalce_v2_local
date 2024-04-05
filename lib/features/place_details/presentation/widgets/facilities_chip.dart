import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class FacilitiesChip extends StatelessWidget {
  const FacilitiesChip({
    super.key,
    required this.label,
    required this.count,
  });

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorPalette.secondaryText.withOpacity(.01),
        border: Border.all(
          color: ColorPalette.secondaryText.withOpacity(.3),
          width: 1,
        ),
      ),
      child: Text.rich(
        TextSpan(
            text: label,
            style: TextStyle(
              color: ColorPalette.secondaryText,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: " ($count)",
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ]),
      ),
    );
  }
}
