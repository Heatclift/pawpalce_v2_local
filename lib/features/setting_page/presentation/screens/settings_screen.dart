import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/common/presentation/widgets/confirmation_dialog.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pawplaces/main.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "SettingsScreen";
  static const route = "SettingsScreen";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            Row(
              children: [
                const Gap(15),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.accentText.withOpacity(.2),
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          size: 30,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                const Text(
                  "Setting",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
            const Gap(15),
            const SettingsListItem(
              label: "Personal Info.",
            ),
            const Gap(15),
            const SettingsListItem(
              label: "Referral Friends ",
            ),
            const Gap(15),
            const SettingsListItem(
              label: "VIP Benefit",
            ),
            const Gap(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Privacy & Security",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
            const Gap(15),
            const SettingsListItem(
              label: "Change password",
            ),
            const Gap(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
            const Gap(15),
            const SettingsListItem(
              label: "Help Center?",
            ),
            const Gap(15),
            const SettingsListItem(
              label: "Term of Service",
            ),
            const Gap(15),
            const SettingsListItem(
              label: "Privacy Policy",
            ),
            const Gap(15),
            const SettingsListItem(
              label: "About Us",
            ),
            const Gap(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Other",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
            const Gap(15),
            SettingsListItem(
              label: "Logout",
              color: Colors.red,
              ontap: () {
                ConfirmationDialog.showDialog(
                  context: context,
                  msg: "Are you sure you want to log out?",
                  title: "Log out",
                  onConfirm: () async {
                    await dpLocator<SessionStore>().logOut();
                    router.goNamed(OnboardingScreen.routeName);
                  },
                );
              },
            ),
            const Gap(120),
          ],
        ),
      ),
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final String label;
  final void Function()? ontap;
  final Color? color;
  const SettingsListItem({
    super.key,
    required this.label,
    this.ontap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: color ?? ColorPalette.accentText,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: color ?? ColorPalette.accentText,
              size: 30,
            ),
          ],
        ),
        // child: ListTile(
        //   onTap: ontap,
        //   dense: true,
        //   minVerticalPadding: 0,
        //   title: Text(
        //     label,
        //     style: TextStyle(
        //       fontWeight: FontWeight.w500,
        //       fontSize: 16,
        //       color: ColorPalette.accentText,
        //     ),
        //   ),
        //   trailing: Icon(
        //     Icons.chevron_right_rounded,
        //     color: ColorPalette.accentText,
        //     size: 30,
        //   ),
        // ),
      ),
    );
  }
}
