import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class PasswordChangeSuccess extends StatelessWidget {
  const PasswordChangeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 250,
          left: 0,
          right: 0,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              "assets/images/dogModel1.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 450,
          left: 30,
          right: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password changed successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              const Text(
                "Your password has been changed successfully, we will let you know if there are more problem with your acccount",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
