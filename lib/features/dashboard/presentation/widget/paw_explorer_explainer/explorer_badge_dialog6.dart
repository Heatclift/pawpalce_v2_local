import 'package:flutter/material.dart';

class ExplorerBadgeDialog6 extends StatelessWidget {
  const ExplorerBadgeDialog6({super.key});

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
                      'Become a Local Pawplace Legend',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE15920),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'See your discoveries featured on the Pawplaces map and inspire others to explore their own neighborhoods!',
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
