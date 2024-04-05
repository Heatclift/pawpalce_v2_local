import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/widgets/orange_button.dart';
import 'package:pawplaces/features/login/presentation/stores/authentication_store.dart';
import 'package:pinput/pinput.dart';

class VerifyOTPScreen extends StatefulWidget {
  static String routeName = "VerifyOTPScreen";
  static String route = "VerifyOTPScreen";
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<VerifyOTPScreen> {
  final store = dpLocator<AuthenticationStore>();
  String? code;

  @override
  void initState() {
    store.setupReactions(context);
    super.initState();
  }

  @override
  void dispose() {
    store.disposeReactions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: ColorPalette.primaryColor,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color.fromRGBO(234, 239, 243, 1),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: const Color(0xFFFB6021),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return LoaderOverlay(
      overlayWidgetBuilder: (progress) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            color: Colors.white.withOpacity(.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitRing(
                  color: ColorPalette.primaryColor,
                ),
                const Text(
                  "Signing you in...",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: ColorPalette.primaryColor,
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
              ),
            ),
            Positioned(
              top: 280,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Authentication",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Enter the 6-digits code that you received on your email.",
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorPalette.secondaryAccentColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FittedBox(
                    child: Pinput(
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      onChanged: (value) {
                        setState(() {
                          code = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Observer(builder: (context) {
                if (store.isLoading) {
                  context.loaderOverlay.show();
                } else {
                  context.loaderOverlay.hide();
                }
                return Column(
                  children: [
                    OrangeButton(
                      text: "Verify OTP",
                      onClick: () {
                        if (code != null) {
                          store.loginWithNumber(code!);
                        } else {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.bottomSlide,
                            dialogType: DialogType.error,
                            title: 'Error',
                            desc: "Please enter code",
                            btnOkOnPress: () {},
                          ).show();
                        }
                      },
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
