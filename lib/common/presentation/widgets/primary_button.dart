import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onClick;
  final String? text;
  final bool enabled;
  final double? height;
  final double? width;
  final Widget? leading;
  final Widget? trailing;

  const PrimaryButton({
    super.key,
    this.onClick,
    this.text,
    this.enabled = true,
    this.height = 50,
    this.width = 105,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        backgroundColor: ColorPalette.primaryButtonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        minimumSize: Size(width!, height!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading ?? const SizedBox.shrink(),
          Text(
            text ?? '',
            style: TextStyle(
              color: ColorPalette.primaryColorDark,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
