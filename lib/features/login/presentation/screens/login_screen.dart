import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/features/otp/presentation/screens/reset_password_screen.dart';
import 'package:pawplaces/features/register/presentation/screens/register_screen.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/orange_button.dart';
import 'package:pawplaces/common/presentation/widgets/text_form_field.dart';

class Login extends StatefulWidget {
  static String routeName = "Login";
  static String route = "/Login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Login with your account to continue.",
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
                const Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const CustomTextFormField(
                  labelText: 'Enter Email',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
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
                  labelText: 'Enter Password',
                  keyboardType: TextInputType.text,
                  obscureText: _obscurePassword,
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
                      color: ColorPalette.accentText,
                    ),
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
            child: Column(
              children: [
                OrangeButton(
                  text: "Login",
                  onClick: () {
                    context.goNamed(Dashboard.routeName);
                  },
                ),
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.goNamed(Register.routeName);
                  },
                  child: const Text(
                    "Register Now",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFB6021),
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
