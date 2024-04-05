import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/orange_button.dart';
import 'package:pawplaces/features/otp/presentation/screens/pages/authentication_view.dart';
import 'package:pawplaces/features/otp/presentation/screens/pages/new_password_view.dart';
import 'package:pawplaces/features/otp/presentation/screens/pages/password_change_sucess_view.dart';
import 'package:pawplaces/features/otp/presentation/screens/pages/reset_password_view.dart';

class ResetPasswordScreen extends StatefulWidget {
  static String routeName = "ResetPasswordScreen";
  static String route = "ResetPasswordScreen";
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  final controller = PageController();
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
          Positioned.fill(
            child: Container(
              color: ColorPalette.primaryColor,
            ),
          ),
          Positioned(
            top: 400,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/images/paw_purple1.svg",
              fit: BoxFit.cover,
            ),
          ),
          if (currentPageIndex != 3)
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
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
              ResetPassword(),
              Authentication(),
              NewPassword(),
              PasswordChangeSuccess(),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                OrangeButton(
                  text: getPageButtonText(currentPageIndex),
                  onClick: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getPageButtonText(int index) {
    switch (index) {
      case 0:
        return 'Recover Password';
      case 1:
        return 'Continue';
      case 2:
        return 'Save Password';
      default:
        return 'Done';
    }
  }
}
