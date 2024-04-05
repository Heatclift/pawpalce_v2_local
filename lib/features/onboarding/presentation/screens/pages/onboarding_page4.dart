import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/images/dogModel2.png",
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            "assets/images/bubble1.svg",
            fit: BoxFit.cover,
            allowDrawingOutsideViewBox: true,
            height: 500,
          ),
        ),
        Positioned(
          top: 200,
          left: 30,
          right: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                const TextSpan(
                    text:
                        "Paul envisioned a world where pawrents and their furry friends could explore together, without limitations. A world where every outing is an adventure, every walk a new discovery, and every wag a celebration. And so,",
                    children: [
                      TextSpan(
                        text: " PawPlaces was born!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.primaryText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
