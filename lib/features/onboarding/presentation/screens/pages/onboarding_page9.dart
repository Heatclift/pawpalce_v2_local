import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class OnboardingPage9 extends StatelessWidget {
  const OnboardingPage9({super.key});

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
          top: 200,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            "assets/images/bubble9.svg",
            fit: BoxFit.cover,
            allowDrawingOutsideViewBox: true,
            height: 400,
          ),
        ),
        Positioned(
          top: 300,
          left: 30,
          right: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                const TextSpan(
                  text: "Tail wags and excited barks, Koala, the",
                  children: [
                    TextSpan(
                      text: " PawPlaces",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " Pup and Chief Cuteness Officer",
                    ),
                  ],
                ),
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
