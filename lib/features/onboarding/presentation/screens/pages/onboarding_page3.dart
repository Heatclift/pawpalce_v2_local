import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

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
                        "When I was just a tiny pup, Paul  found himself struggling to take me out with him. Leaving me home alone made me cry (puppies are sensitive!), and finding dog-friendly places felt like an impossible mission. That's when the spark of PawPlaces",
                    children: [
                      TextSpan(
                        text: " PawPlaces",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " ignited!",
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
