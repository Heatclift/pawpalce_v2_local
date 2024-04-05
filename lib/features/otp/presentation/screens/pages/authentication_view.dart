import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 280,
          left: 30,
          right: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Authentication",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              const Text(
                "Enter the 6-digits code that you received on your email.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              // OtpTextField(
              //   numberOfFields: 6,
              //   showFieldAsBox: true,
              //   filled: true,
              //   fillColor: Colors.white,
              //   borderRadius: BorderRadius.circular(15),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
