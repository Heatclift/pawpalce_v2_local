import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/common/presentation/widgets/text_form_field.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/orange_button.dart';
import 'package:pawplaces/features/register/presentation/stores/register_store.dart';

class Register extends StatefulWidget {
  static const routeName = "Register";
  static const route = "Register";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _password;

  final store = RegistrationStore();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> initIdentity() async {
    var session = await SessionService.getSession();
    if (session?.phoneNumber != null) {
      store.phoneNumber = session?.phoneNumber;
    }
  }

  @override
  void initState() {
    initIdentity();
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
              top: 75,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
              ),
            ),
            const Positioned(
              top: 230,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create your account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Enter your personal details to create account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: 295,
              left: 30,
              right: 30,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(5),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Your Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomTextFormField(
                                  labelText: 'Enter firstname',
                                  controller: firstNameController,
                                  keyboardType: TextInputType.text,
                                  fillColor: Colors.white,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Last Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomTextFormField(
                                  labelText: 'Enter lastname',
                                  keyboardType: TextInputType.text,
                                  fillColor: Colors.white,
                                  controller: lastNameController,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Observer(builder: (context) {
                        if (store.phoneNumber != null) {
                          return const SizedBox.shrink();
                        }

                        return Column(
                          children: [
                            const Text(
                              'Mobile Number',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                            ),
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
                                searchBoxBackgroundColor:
                                    Colors.white.withOpacity(.2),
                                selectedItemColor: ColorPalette.primaryColorDark
                                    .withOpacity(.5),
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
                          ],
                        );
                      }),
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextFormField(
                        labelText: 'Enter email',
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        fillColor: Colors.white,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextFormField(
                        labelText: 'Enter password',
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: _obscurePassword,
                        fillColor: Colors.white,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          child: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorPalette.secondaryText,
                          ),
                        ),
                        onChange: (value) => _password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextFormField(
                        labelText: 'Enter password',
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: _obscureConfirmPassword,
                        fillColor: Colors.white,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                          child: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorPalette.secondaryText,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Observer(builder: (context) {
                            if (store.isLoading) {
                              context.loaderOverlay.show();
                            } else {
                              context.loaderOverlay.hide();
                            }
                            return Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide.none,
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                              checkColor: ColorPalette.primaryColor,
                              value: store.isTermsAgreed,
                              onChanged: (bool? value) {
                                store.isTermsAgreed = value ?? false;
                              },
                            );
                          }),
                          const Text(
                            'By creating your account, you agree to Koala’s \nPrivacy Policy and Terms of Use.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OrangeButton(
                            text: "Create Account",
                            onClick: () {
                              if (_formKey.currentState!.validate() &&
                                  store.isTermsAgreed) {
                                _formKey.currentState!.save();
                                store.register(
                                  phoneNumber: store.phoneNumber!,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  photo: "",
                                );
                              } else {
                                if (!store.isTermsAgreed) {
                                  store.error =
                                      "Please agree to Koala's Privacy Policy and Terms of Use.";
                                }
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
