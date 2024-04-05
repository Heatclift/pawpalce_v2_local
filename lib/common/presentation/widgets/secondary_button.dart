import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onClick;
  final String? text;
  final bool enabled;
  final double height;
  final double borderRadius;
  final double width;
  final Widget? leading;
  final Widget? trailing;
  final Color? forgroundColor;

  const SecondaryButton({
    super.key,
    this.onClick,
    this.text,
    this.enabled = true,
    this.height = 50,
    this.width = 105,
    this.leading,
    this.trailing,
    this.borderRadius = 50,
    this.forgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(.40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        minimumSize: Size(width, height),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading ?? const SizedBox.shrink(),
          Text(
            text ?? '',
            style: const TextStyle(
              color: Colors.white,
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
