import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChange;
  final bool isEnable;

  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.fillColor,
    this.controller,
    this.validator,
    this.onChange,
    this.isEnable = true,
    this.prefixIcon,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      focusNode: focusNode,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        hintText: labelText,
        prefixIcon: prefixIcon,

        hintStyle: TextStyle(
          color: ColorPalette.secondaryText,
        ),
        filled: true,
        enabled: isEnable,
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
