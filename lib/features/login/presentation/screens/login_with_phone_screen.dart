import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/login/presentation/stores/authentication_store.dart';
import 'package:pawplaces/features/otp/presentation/screens/reset_password_screen.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/orange_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginWithPhone extends StatefulWidget {
  static String routeName = "LoginWithPhone";
  static String route = "/LoginWithPhone";
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final store = dpLocator<AuthenticationStore>();

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
            Container(
              color: ColorPalette.primaryColor,
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
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
              ),
            ),
            const Positioned(
              top: 280,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "LoginWithPhone with your account to continue.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 380,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InternationalPhoneNumberInput(
                    height: 45,
                    onInputChanged: (number) {
                      if (number.fullNumber.length <= 16) {
                        store.phoneNumber = number.fullNumber;
                      }
                    },
                    dialogConfig: DialogConfig(
                      backgroundColor: ColorPalette.primaryColor,
                      flatFlag: true,
                      topBarColor: Colors.black.withOpacity(.5),
                      searchBoxBackgroundColor: Colors.white.withOpacity(.2),
                      selectedItemColor:
                          ColorPalette.primaryColorDark.withOpacity(.5),
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    countryConfig: CountryConfig(
                      flatFlag: true,
                      flagSize: 25,
                      textStyle: TextStyle(
                        color: ColorPalette.accentTextDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    ),
                    betweenPadding: 10,
                    phoneConfig: PhoneConfig(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                        color: ColorPalette.accentTextDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      radius: 50,
                      borderWidth: 0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.goNamed(ResetPasswordScreen.routeName);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 600,
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
                      text: "Signin or Signup with phone",
                      onClick: () async {
                        if (store.phoneNumber != null) {
                          store.verifyPhoneNumber(store.phoneNumber!);
                        } else {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.bottomSlide,
                            dialogType: DialogType.error,
                            title: 'Error',
                            desc: "Plase input your mobile number",
                            btnOkOnPress: () {},
                          ).show();
                        }
                      },
                    ),
                    // const Text(
                    //   "Don't have an account?",
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     context.goNamed(Register.routeName);
                    //   },
                    //   child: const Text(
                    //     "Register Now",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       color: Color(0xFFFB6021),
                    //     ),
                    //   ),
                    // ),
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
