import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChange;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
    this.fillColor,
    this.controller,
    this.validator,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        hintText: labelText,
        hintStyle: TextStyle(
          color: ColorPalette.secondaryText,
        ),
        filled: true,
        fillColor: fillColor ?? ColorPalette.secondaryAccentColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon, // Add this line to integrate the suffix icon
      ),
    );
  }
}
