import 'package:flutter/material.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/primary_button.dart';
import 'package:pawplaces/common/presentation/widgets/secondary_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page1.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page2.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page3.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page4.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page5.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page6.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page7.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page8.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/pages/onboarding_page9.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = "OnboardingScreen";
  static String route = "/OnboardingScreen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (currentPageIndex == 0 ||
              currentPageIndex == 1 ||
              currentPageIndex == 6)
            Positioned.fill(
              child: Container(
                color: ColorPalette.primaryColor,
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/images/paw_purple.svg",
              fit: BoxFit.cover,
            ),
          ),
          if (currentPageIndex == 2 ||
              currentPageIndex == 3 ||
              currentPageIndex == 7)
            Positioned.fill(
              child: Container(
                color: const Color.fromARGB(255, 43, 189, 141),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/images/paw_green.svg",
              fit: BoxFit.cover,
            ),
          ),
          if (currentPageIndex == 4 ||
              currentPageIndex == 5 ||
              currentPageIndex == 8)
            Positioned.fill(
              child: Container(
                color: const Color.fromARGB(255, 211, 172, 53),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/images/paw_yellow.svg",
              fit: BoxFit.cover,
            ),
          ),
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: const [
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
              OnboardingPage4(),
              OnboardingPage5(),
              OnboardingPage6(),
              OnboardingPage7(),
              OnboardingPage8(),
              OnboardingPage9(),
            ],
          ),
          if (currentPageIndex != 8)
            Positioned(
              top: 70,
              left: 25,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(
                    value: (currentPageIndex + 1) / 8,
                    backgroundColor: Colors.grey.withOpacity(.5),
                    color: const Color.fromRGBO(251, 96, 33, 1),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          if (currentPageIndex != 8)
            Positioned(
              bottom: 50,
              left: 25,
              right: 25,
              child: Row(
                children: [
                  PrimaryButton(
                    text: "Next",
                    onClick: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    width: 120,
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: ColorPalette.primaryColorDark,
                    ),
                  ),
                  const Spacer(),
                  SecondaryButton(
                    text: "Skip",
                    onClick: () {
                      context.goNamed(Dashboard.routeName);
                    },
                  ),
                ],
              ),
            ),
          if (currentPageIndex == 8)
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
              ),
            ),
          if (currentPageIndex == 8)
            Positioned(
              bottom: 50,
              left: 25,
              right: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      minimumSize: const Size(300, 60),
                    ),
                    onPressed: () {
                      context.goNamed(Dashboard.routeName);
                    },
                    child: const Text(
                      "GET STARTED",
                      style: TextStyle(
                        color: Color(0xFFD0A725),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
