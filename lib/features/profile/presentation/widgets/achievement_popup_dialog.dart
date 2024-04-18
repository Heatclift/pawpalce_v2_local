import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:im_stepper/stepper.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class AchivementPopupDialog extends StatefulWidget {
  const AchivementPopupDialog({super.key});

  @override
  State<AchivementPopupDialog> createState() => _AchivementPopupDialogState();
}

class _AchivementPopupDialogState extends State<AchivementPopupDialog> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Gap(15),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    size: 35,
                    color: Colors.white.withOpacity(.7),
                  ),
                ),
                Text(
                  "Paw Mapper Badge",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(.7),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Gap(50),
            Center(
                child: SizedBox(
              height: 500,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                children: [
                  Center(
                    child: Container(
                      height: 500,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 500,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(),
                    ),
                  ),
                ],
              ),
            )),
            const Gap(20),
            DotStepper(
              // direction: Axis.vertical,
              dotCount: 2,
              dotRadius: 6,

              /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
              activeStep: pageIndex,
              shape: Shape.circle,
              spacing: 10,
              indicator: Indicator.worm,

              /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
              onDotTapped: (tappedDotIndex) {
                // setState(() {
                //   activeStep = tappedDotIndex;
                // });
              },

              // DOT-STEPPER DECORATIONS
              fixedDotDecoration: FixedDotDecoration(
                color: ColorPalette.accentText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
