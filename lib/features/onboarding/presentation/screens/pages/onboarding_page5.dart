import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class OnboardingPage5 extends StatelessWidget {
  const OnboardingPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/images/dogModel3.png",
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
                    text: "But it's not just about exploring.",
                    children: [
                      TextSpan(
                        text: " PawPlaces",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            " is also about giving back. Because let's face it, not every pup has a loving home like mine.",
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
