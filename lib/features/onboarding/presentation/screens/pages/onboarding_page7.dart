import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class OnboardingPage7 extends StatelessWidget {
  const OnboardingPage7({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/images/dogModel4.png",
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
                    text: "So, are you ready to join the ",
                    children: [
                      TextSpan(
                        text: " PawPlaces",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            " pack? Whether you're a seasoned dog owner or just welcoming a furry friend into your life,",
                      ),
                      TextSpan(
                        text: " PawPlaces",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            " is your one-stop shop for fun, connection, and making a pawsitive impact.",
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
