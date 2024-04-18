import 'package:flutter/material.dart';

class MapperBadgeDialog1 extends StatelessWidget {
  const MapperBadgeDialog1({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 500,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFE15920),
              width: 5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Paw Mapper Badge',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE15920),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/images/10+.png",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'The Pawplaces PawMapper Badge is a recognition for adventurous users who help map out the world for pet owners!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/paw_lower_left.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
