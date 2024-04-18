import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';

class MapFilterDialog extends StatefulWidget {
  const MapFilterDialog({super.key});

  @override
  State<MapFilterDialog> createState() => _MapFilterDialogState();
}

class _MapFilterDialogState extends State<MapFilterDialog> {
  final store = dpLocator<DashboardStore>();
  final filters = [
    "Apartment",
    "Grooming",
    "Pet Hotel",
    "Hotel",
    "Pet Hospital",
    "Mall",
    "Park",
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
                (index) => Observer(builder: (context) {
                  final value =
                      filters[index].replaceAll(" ", "").toLowerCase();
                  final isActive = store.filters.contains(value);
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    onTap: () {
                      store.setFilter(value);
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isActive) ...[
                          Icon(
                            Icons.check,
                            color: ColorPalette.primaryColor,
                          ),
                          const Gap(
                            10,
                          )
                        ],
                        Text(
                          filters[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const Divider(),
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
                  Navigator.of(context).pop();
                },
                title: Text(
                  "Done",
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
