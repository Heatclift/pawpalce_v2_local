import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/text_form_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  NewPasswordState createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
                "New Password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              Text(
                "Set your new password so you can login and access the PawPlace",
                style: TextStyle(
                  fontSize: 15,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'New Password',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              CustomTextFormField(
                labelText: 'Enter Password',
                keyboardType: TextInputType.text,
                obscureText: _obscurePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  child: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: ColorPalette.accentText,
                  ),
                ),
              ),
              Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.primaryColorLight,
                ),
              ),
              CustomTextFormField(
                labelText: 'Enter Password',
                keyboardType: TextInputType.text,
                obscureText: _obscureConfirmPassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  child: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorPalette.accentText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
