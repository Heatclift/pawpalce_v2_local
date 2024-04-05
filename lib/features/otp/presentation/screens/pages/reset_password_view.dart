import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/text_form_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                "Reset Password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              Text(
                "Enter the email address you used when you joined and we’ll send you instructions to rest your password.",
                style: TextStyle(
                  fontSize: 15,
                  color: ColorPalette.secondaryText,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              const CustomTextFormField(
                labelText: 'Enter Email',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
