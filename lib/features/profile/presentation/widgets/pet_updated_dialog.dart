import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class PetUpadtedDialog extends StatefulWidget {
  const PetUpadtedDialog({
    super.key,
    required this.petName,
  });

  final String petName;

  @override
  State<PetUpadtedDialog> createState() => _PetUpadtedDialogState();
}

class _PetUpadtedDialogState extends State<PetUpadtedDialog> {
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
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
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          "assets/images/paw_purple_center.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        left: 20,
                        right: 20,
                        child: SingleChildScrollView(
                          child: AnimationLimiter(
                            child: Column(
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  verticalOffset: 100.0,
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                ),
                                children: [
                                  const Gap(45),
                                  ScaleAnimation(
                                    child: Image.asset(
                                      "assets/images/koala_glowing.png",
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const Gap(25),
                                  const Text(
                                    "Pet Info Updated!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // const Gap(20),
                                  // Text(
                                  //   "We welcome ${widget.petName}! We're excited to embark on this new journey with our newest furry friend.",
                                  //   textAlign: TextAlign.center,
                                  //   style: const TextStyle(
                                  //     fontWeight: FontWeight.w400,
                                  //     fontSize: 15,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
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
      ),
    );
  }
}
