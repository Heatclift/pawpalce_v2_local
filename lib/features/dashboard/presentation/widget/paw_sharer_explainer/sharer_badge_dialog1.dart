import 'package:flutter/material.dart';

class SharerBadgeDialog1 extends StatelessWidget {
  const SharerBadgeDialog1({super.key});

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
                      'Paw Sharer Badge',
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
                        "assets/badges/sharer_big.png",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      "The Sharer badge is granted to users who frequently distribute or promote content within a platform or community.",
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
