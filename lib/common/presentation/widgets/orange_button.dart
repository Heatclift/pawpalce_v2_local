import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final void Function()? onClick;
  final String? text;
  final bool enabled;
  final double? height;
  final double? width;
  final Widget? leading;
  final Widget? trailing;

  const OrangeButton({
    super.key,
    this.onClick,
    this.text,
    this.enabled = true,
    this.height = 60,
    this.width = 350,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFFB6021),
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
