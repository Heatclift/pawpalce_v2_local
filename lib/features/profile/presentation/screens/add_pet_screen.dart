import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/custom_drop_down_menu.dart';
import 'package:pawplaces/common/presentation/widgets/text_form_field.dart';
import 'package:pawplaces/features/profile/presentation/stores/add_pet_store.dart';

class AddPetScreen extends StatefulWidget {
  static String routeName = "AddPetScreen";
  static String route = "AddPetScreen";
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final store = AddPetStore();

  final petNameController = TextEditingController();
  final breedController = TextEditingController();
  final typeController = TextEditingController();
  final birthdateController = TextEditingController();
  final sexController = TextEditingController();
  final colorController = TextEditingController();
  final registrationNoController = TextEditingController();

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
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      "Add new Pet",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (store.selectedPetType == null) {
                            store.error = null;
                            store.error = "Please select your pet's type.";
                          } else {
                            _formKey.currentState!.save();
                            store.addPet(
                              petName: petNameController.text,
                              petBirthdate: birthdateController.text,

                              /// todo: implement with api
                              petBreedId: null,

                              petGender: sexController.text,
                              petColor: colorController.text,
                              petRegistrationNumber:
                                  registrationNoController.text,
                            );
                          }
                        } else {
                          store.error = null;
                          store.error = "Please fill the required fields.";
                        }
                      },
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
                    GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();

                        // ignore: unused_local_variable
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (image != null) {
                          CroppedFile? croppedFile =
                              await ImageCropper().cropImage(
                            sourcePath: image.path,
                            aspectRatio: const CropAspectRatio(
                              ratioX: 500,
                              ratioY: 500,
                            ),
                            uiSettings: [
                              AndroidUiSettings(
                                toolbarTitle: 'Crop Image',
                                toolbarColor: ColorPalette.primaryColorDark,
                                toolbarWidgetColor:
                                    ColorPalette.secondaryAccentColor,
                                activeControlsWidgetColor:
                                    ColorPalette.primaryColorDark,
                                hideBottomControls: true,
                                lockAspectRatio: true,
                              ),
                              IOSUiSettings(
                                title: 'Crop Image',
                                aspectRatioLockEnabled: true,
                                resetButtonHidden: true,
                                rotateButtonsHidden: true,
                                rotateClockwiseButtonHidden: true,
                                aspectRatioPickerButtonHidden: true,
                              ),
                            ],
                          );

                          if (croppedFile != null) {
                            await store.setPicture(XFile(croppedFile.path));
                          }
                        }
                      },
                      child: SizedBox(
                        height: 155,
                        child: Observer(builder: (context) {
                          if (store.isLoading) {
                            context.loaderOverlay.show();
                          } else {
                            context.loaderOverlay.hide();
                          }

                          final pic = store.petPic;
                          if (pic != null) {
                            return AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        File(pic.path),
                                      ),
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
                            );
                          }

                          return AspectRatio(
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
                          );
                        }),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name of Pet",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const Gap(10),
                      CustomTextFormField(
                        labelText: 'Enter Name of Pet',
                        controller: petNameController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your pet's name";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pet Type",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const Gap(10),
                      Observer(builder: (context) {
                        final types = store.petTypes;
                        return CustomDropDownMenu(
                          controller: typeController,
                          label: "Select Type",
                          items: types
                              .map((e) => (key: e.label, name: e.label))
                              .toList(),
                          onSelect: (value) {
                            if (value != null) {
                              store.setSelectedPetType(value);
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
                // const Gap(20),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         "Breed",
                //         style: TextStyle(
                //             fontWeight: FontWeight.w400, fontSize: 15),
                //       ),
                //       const Gap(10),
                //       CustomTextFormField(
                //         labelText: 'Enter Breed',
                //         controller: breedController,
                //         keyboardType: TextInputType.text,
                //         obscureText: false,
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return "Please enter your pet's breed";
                //           }
                //           return null;
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date of Birth",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () async {
                          var dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1999),
                            lastDate: DateTime.now(),
                          );

                          if (dateTime != null) {
                            birthdateController.text =
                                DateFormat('MM-dd-yyyy').format(dateTime);
                          }
                        },
                        child: CustomTextFormField(
                          labelText: 'Enter Date of Birth',
                          controller: birthdateController,
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: ColorPalette.primaryColor,
                          ),
                          keyboardType: TextInputType.text,
                          isEnable: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your pet's date of birth";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // const Gap(20),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         "Sex",
                //         style:
                //             TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                //       ),
                //       const Gap(10),
                //       CustomTextFormField(
                //         labelText: 'Enter Sex',
                //         controller: sexController,
                //         keyboardType: TextInputType.text,
                //         obscureText: false,
                //       ),
                //     ],
                //   ),
                // ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Color",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const Gap(10),
                      CustomTextFormField(
                        labelText: 'Enter Color',
                        controller: colorController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your pet's color";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Registration #",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const Gap(10),
                      CustomTextFormField(
                        labelText: 'Enter Registration #',
                        controller: registrationNoController,
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
        ),
      ),
    );
  }
}
