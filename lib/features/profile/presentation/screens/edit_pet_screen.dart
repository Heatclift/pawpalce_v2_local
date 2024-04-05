import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/presentation/widgets/text_form_field.dart';

class EditPetScreen extends StatefulWidget {
  static String routeName = "EditPetScreen";
  static String route = "EditPetScreen";
  const EditPetScreen({super.key});

  @override
  State<EditPetScreen> createState() => _EditPetScreenState();
}

class _EditPetScreenState extends State<EditPetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(60),
            Row(
              children: [
                const Gap(15),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 35,
                  ),
                ),
                const Text(
                  "Edit Pet Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Gap(15),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                const Gap(20),
                SizedBox(
                  height: 155,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/icons/petPicPlaceHolder.png",
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: SvgPicture.asset(
                            "assets/icons/addButtonPurple.svg",
                            fit: BoxFit.contain,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Gap(25),
            // const Row(
            //   children: [
            //     Gap(20),
            //     Flexible(
            //       flex: 1,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "First Name",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.w400, fontSize: 15),
            //           ),
            //           Gap(10),
            //           CustomTextFormField(
            //             labelText: 'Enter First Name',
            //             keyboardType: TextInputType.text,
            //             obscureText: false,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Gap(10),
            //     Flexible(
            //       flex: 1,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Last Name",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.w400, fontSize: 15),
            //           ),
            //           Gap(10),
            //           CustomTextFormField(
            //             labelText: 'Enter Last Name',
            //             keyboardType: TextInputType.text,
            //             obscureText: false,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Gap(20),
            //   ],
            // ),
            // const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name of Pet",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Name of Pet',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                ],
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Breed",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Breed',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                ],
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date of Birth",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Date of Birth',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                ],
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sex",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Sex',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                ],
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Color",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Color',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                ],
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Registration #",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Registration #',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
