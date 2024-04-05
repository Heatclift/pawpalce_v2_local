import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PawSupportComingSoon extends StatefulWidget {
  const PawSupportComingSoon({
    super.key,
    this.onTapSearch,
  });

  final void Function()? onTapSearch;

  @override
  State<PawSupportComingSoon> createState() => _PawSupportComingSoonState();
}

class _PawSupportComingSoonState extends State<PawSupportComingSoon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/cat.png",
              height: 150,
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "PawMarket \ncoming soon!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
