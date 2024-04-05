import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

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
              Text(
                "Hi everyone!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryText,
                ),
              ),
              Text.rich(
                const TextSpan(text: "Koala here, the official", children: [
                  TextSpan(
                    text: " PawPlaces",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        " mascot and Paul's (my amazing pawrent!) loyal companion.",
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
