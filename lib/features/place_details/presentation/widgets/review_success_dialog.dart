import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:share_plus/share_plus.dart';

class ReviewSuccessDialog extends StatefulWidget {
  final PlaceModel place;
  const ReviewSuccessDialog({
    super.key,
    required this.place,
  });

  @override
  State<ReviewSuccessDialog> createState() => _ReviewSuccessDialogState();
}

class _ReviewSuccessDialogState extends State<ReviewSuccessDialog> {
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
                                      "assets/icons/place_paw.png",
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const Gap(25),
                                  const Text(
                                    "Thank you for your review!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Gap(20),
                                  const Text(
                                    "Your review has been posted",
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
                                      Share.share(
                                        'Check out ${widget.place.placeName} on PawPlaces: https://pawplaces.app/Dashboard?pawplace=${widget.place.placeId}',
                                        subject:
                                            "Check out ${widget.place.placeName} on PawPlaces",
                                      );
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
                                          "Share Place",
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
      ),
    );
  }
}
