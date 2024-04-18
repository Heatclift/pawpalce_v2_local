import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/choose_country/widget/country_button.dart';
import 'package:pawplaces/features/choose_country/widget/gridview_button.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/features/register/presentation/widgets/register_success_dialog.dart';
import 'package:pawplaces/main.dart';

class ChooseCountry extends StatefulWidget {
  static String routeName = "ChooseCountry";
  static String route = "/ChooseCountry";
  const ChooseCountry({super.key});

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: ColorPalette.primaryColor,
                ),
                Positioned(
                  bottom: 0,
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
                  top: 250,
                  left: 0,
                  right: 0,
                  child: Text(
                    "PawPlaces is also about giving back. Let's face it, not every pup has a loving home. That's why we donate a portion of every app subscription to the animal rescue or charity that you choose below:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 350,
                  left: 30,
                  right: 30,
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildCountryButtons(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: selectedCountry != null,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              minimumSize: const Size(300, 60),
                            ),
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (context) =>
                                    const RegistesSuccessDialog(),
                              );
                              router.goNamed(Dashboard.routeName);
                            },
                            child: const Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCountryButtons() {
    List<Widget> buttons = [];
    buttons.addAll([
      _buildCountryButton("United Kingdom", 'assets/icons/uk.png'),
      const SizedBox(
        height: 10,
      ),
      _buildCountryButton("Philippines", 'assets/icons/ph.png'),
      const SizedBox(
        height: 10,
      ),
      _buildCountryButton("Vietnam", 'assets/icons/viet.png'),
      const SizedBox(
        height: 10,
      ),
      _buildCountryButton("United Arab Emirates", 'assets/icons/uae.png'),
      const SizedBox(
        height: 10,
      ),
      _buildCountryButton("New Zealand", 'assets/icons/nz.png'),
      const SizedBox(
        height: 10,
      ),
      _buildCountryButton("International", 'assets/icons/globe.png'),
      const SizedBox(
        height: 10,
      ),
    ]);

    if (selectedCountry != null) {
      buttons.insert(
          buttons.indexWhere((widget) =>
                  widget is CountryButton && widget.text == selectedCountry!) +
              1,
          const GridviewButton(
            imagePaths: [
              'assets/icons/companies/1.png',
              'assets/icons/companies/2.png',
              'assets/icons/companies/3.png',
              'assets/icons/companies/4.png',
              'assets/icons/companies/5.png',
              'assets/icons/companies/6.png',
              'assets/icons/companies/7.png',
              'assets/icons/companies/8.png',
              'assets/icons/companies/9.png',
              'assets/icons/companies/10.png',
            ],
          ));
    }

    return buttons;
  }

  Widget _buildCountryButton(String country, String imagePath) {
    return CountryButton(
      text: country,
      imagePath: imagePath,
      isSelected: selectedCountry == country,
      onSelected: (bool? newValue) {
        setState(() {
          if (newValue == true) {
            selectedCountry = country;
          }
        });
      },
    );
  }
}
