import 'package:flutter/material.dart';

class ExplorerBadgeDialog2 extends StatelessWidget {
  const ExplorerBadgeDialog2({super.key});

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
                      'Explore and Expand the \nPawplaces Map',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE15920),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "assets/images/maps.png",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Discover new pet-friendly locations in your area and submit them to Pawplaces. The more locations you add, the closer you get to becoming a PawMapper extraordinaire!',
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
