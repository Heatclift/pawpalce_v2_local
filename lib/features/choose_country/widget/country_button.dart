import 'package:flutter/material.dart';

class CountryButton extends StatelessWidget {
  final String? text;
  final String? imagePath;
  final bool isSelected;
  final ValueChanged<bool?>? onSelected;
  final bool? hasBorder;

  const CountryButton({
    super.key,
    this.text,
    this.imagePath,
    this.isSelected = false,
    this.onSelected,
    this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onSelected != null) {
          onSelected!(!isSelected);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? const Color(0xFFF46428) : Colors.transparent,
              width: 2, // Adjust border width as needed
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    imagePath!,
                    height: 24.0,
                    width: 24.0,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Radio(
                value: isSelected,
                groupValue: true,
                onChanged: (bool? newValue) {
                  if (onSelected != null) {
                    onSelected!(newValue);
                  }
                },
                activeColor: const Color(0xFFF46428),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
