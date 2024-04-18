import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/login/presentation/screens/login_with_phone_screen.dart';
import 'package:pawplaces/main.dart';
import 'package:rive/rive.dart';

class AchievementUnlockedDialog extends StatefulWidget {
  const AchievementUnlockedDialog({
    super.key,
  });

  @override
  State<AchievementUnlockedDialog> createState() =>
      _AchievementUnlockedDialogState();
}

class _AchievementUnlockedDialogState extends State<AchievementUnlockedDialog> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) {
          _controllerCenter.play();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirection: pi / 2,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                shouldLoop:
                    false, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
              ),
              Container(
                width: 325,
                height: 496,
                decoration: BoxDecoration(
                  color: ColorPalette.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        "assets/images/reward_back_ground.svg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned.fill(
                      right: 20,
                      left: 20,
                      child: SingleChildScrollView(
                        child: AnimationLimiter(
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 500),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                verticalOffset: 100.0,
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                              children: [
                                const Gap(35),
                                const Text(
                                  "Congratulations! 🎉",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(20),
                                const SlideAnimation(
                                  child: SizedBox(
                                    height: 135,
                                    child: RiveAnimation.asset(
                                      'assets/animations/pawcoin.riv',
                                    ),
                                  ),
                                ),
                                const Gap(20),
                                const Text(
                                  "You've unlocked",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "PawMaster Badge!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(20),
                                const Text(
                                  "Keep up the great work exploring PawPlaces!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(30),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    router.goNamed(LoginWithPhone.routeName);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFFB6021),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                    minimumSize: const Size(150, 50),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Claim Badge",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    .animate(
                                      autoPlay: true,
                                      onComplete: (controller) {
                                        controller.loop();
                                      },
                                    )
                                    .shake(
                                      delay: const Duration(seconds: 5),
                                      hz: 3,
                                      offset: const Offset(10, 0),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.5),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
