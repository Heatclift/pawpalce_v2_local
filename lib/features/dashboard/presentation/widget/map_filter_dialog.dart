import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class MapFilterDialog extends StatelessWidget {
  MapFilterDialog({super.key});

  final filters = [
    "New Discoveries",
    "Apartment",
    "Grooming",
    "Pet Hotel",
    "Hotels",
    "Pet Hospital",
    "Malls",
    "Parks",
    "Pet Shop",
    "Restaurant",
    "Cafe",
  ];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 10,
        sigmaX: 10,
      ),
      child: Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Gap(10),
              ...List.generate(
                filters.length,
                (index) => ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    filters[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
                  Navigator.of(context).pop();
                },
                title: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.accentText,
                    fontSize: 20,
                  ),
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
