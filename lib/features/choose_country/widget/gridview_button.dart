import 'package:flutter/material.dart';

class GridviewButton extends StatelessWidget {
  final List<String> imagePaths;
  final void Function()? onClick;

  const GridviewButton({
    super.key,
    required this.imagePaths,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      children: List.generate(
        imagePaths.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: onClick,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Image.asset(
                imagePaths[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
