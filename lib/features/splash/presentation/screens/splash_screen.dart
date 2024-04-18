import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/main.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "SplashScreen";
  static String route = "/SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> redirect() async {
    await dpLocator<SessionStore>().initSession();
    final path = dpLocator<SessionStore>().hasSession
        ? Dashboard.route
        : Dashboard.route;
    router.go(path);
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        redirect();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/images/paw_big_inverted.svg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/paw_big.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              child: AnimationLimiter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 300),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 400.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      const Gap(150),
                      SvgPicture.asset("assets/images/Logo_3.svg"),
                      const Gap(150),
                      SizedBox(
                        width: double.maxFinite,
                        child: Image.asset(
                          "assets/images/koala_big.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
