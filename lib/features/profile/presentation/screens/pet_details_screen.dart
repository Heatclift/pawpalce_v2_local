import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/profile/presentation/screens/edit_pet_screen.dart';

class PetDetailsScreen extends StatefulWidget {
  static String routeName = "PetDetailsScreen";
  static String route = "PetDetailsScreen";
  const PetDetailsScreen({super.key});

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorPalette.orange,
                    ColorPalette.orange,
                    ColorPalette.orangeLght,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const Gap(300),
                      Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Gap(290),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(250, 250, 250, 1),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(.3),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Vaccination Record",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Gap(15),
                                  Row(
                                    children: [
                                      Text(
                                        "Rabies Vaccine:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalette.accentText,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "January 1, 2014",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.ashColor,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  Row(
                                    children: [
                                      Text(
                                        "DHPP Vaccine:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalette.accentText,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "March 23, 2011",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.ashColor,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  Row(
                                    children: [
                                      Text(
                                        "Bordetella Vaccine:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalette.accentText,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "June 12, 2012",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.ashColor,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  Row(
                                    children: [
                                      Text(
                                        "Other Vaccines:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalette.accentText,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "January 8, 2016",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.ashColor,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  const Text(
                                    "Surgery History",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Gap(15),
                                  Row(
                                    children: [
                                      Text(
                                        "Neutering/Spaying:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalette.accentText,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "April 12, 2018",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.ashColor,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  Row(
                                    children: [
                                      Text(
                                        "Other Surgeries:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalette.accentText,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "March 10, 2019",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.ashColor,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(100),
                    ],
                  ),
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Row(
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
                                  color: Colors.white.withOpacity(.2),
                                ),
                                child: const Icon(
                                  Icons.chevron_left,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(15),
                        const Text(
                          "PawsPort",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(EditPetScreen.routeName);
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
                                  color: Colors.white.withOpacity(.2),
                                ),
                                child: const Icon(
                                  Icons.edit_outlined,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(15),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 20,
                    right: 20,
                    child: Container(
                      width: 335,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorPalette.primaryColorDark,
                        boxShadow: [
                          BoxShadow(
                            color:
                                ColorPalette.primaryColorDark.withOpacity(.5),
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          const Gap(27),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/animal1.png",
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                              const Text(
                                "Sadie",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const Gap(25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name of Pet",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        "Sadie",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Gap(15),
                                      Text(
                                        "Date of Birth",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        "January 1, 2018",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Gap(15),
                                      Text(
                                        "Color",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        "Golden White",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Gap(15),
                                      Text(
                                        "Registration #",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        "2300131",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Breed",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        "Labrador Retriever",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Gap(15),
                                      Text(
                                        "Sex",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        "Male",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      // const Gap(15),
                                      // Text(
                                      //   "Microchip ID",
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w400,
                                      //     color: Colors.white.withOpacity(.7),
                                      //     fontSize: 15,
                                      //   ),
                                      // ),
                                      // const Text(
                                      //   "DOG00023131",
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w500,
                                      //     color: Colors.white,
                                      //     fontSize: 15,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(25),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
