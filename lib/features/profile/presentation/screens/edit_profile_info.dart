import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/widgets/text_form_field.dart';
import 'package:pawplaces/features/profile/presentation/stores/edit_profile_store.dart';
import 'package:pawplaces/features/profile/presentation/stores/profile_store.dart';

class EditProfileInfoScreen extends StatefulWidget {
  static String routeName = "EditProfileInfoScreen";
  static String route = "EditProfileInfoScreen";
  const EditProfileInfoScreen({super.key});

  @override
  State<EditProfileInfoScreen> createState() => _EditProfileInfoScreenState();
}

class _EditProfileInfoScreenState extends State<EditProfileInfoScreen> {
  final store = EditProfileStore();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final profileStore = dpLocator<ProfileStore>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController birthDateController;
  late TextEditingController emailController;

  @override
  void initState() {
    final user = profileStore.user;
    firstNameController = TextEditingController(text: user?.firstName);
    lastNameController = TextEditingController(text: user?.lastName);
    birthDateController = TextEditingController();
    emailController = TextEditingController();

    store.setupReactions(context);

    super.initState();
  }

  @override
  void dispose() {
    store.disposeReactions();
    profileStore.getProfileDetails();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = profileStore.user;
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
                  "Loading...",
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
                      "Edit info",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          store.updateProfile(
                            dateOfBirth: birthDateController.text,
                            email: emailController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                          );
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            store.setPicture(XFile(croppedFile.path));
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

                          var profilePic = store.profilePic;
                          bool hasPic = profilePic != null;
                          return AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: hasPic
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.file(
                                            File(store.profilePic!.path),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            "${user?.userPhotoUrl}",
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              "assets/icons/profilePicPlaceHolder.png",
                                            ),
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
                        }),
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
                const Gap(25),
                Row(
                  children: [
                    const Gap(20),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          const Gap(10),
                          CustomTextFormField(
                            labelText: 'Enter First Name',
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            controller: firstNameController,
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
                    const Gap(10),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Last Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          const Gap(10),
                          CustomTextFormField(
                            labelText: 'Enter Last Name',
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            controller: lastNameController,
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
                    const Gap(20),
                  ],
                ),
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
                            birthDateController.text =
                                DateFormat('MM-dd-yyyy').format(dateTime);
                          }
                        },
                        child: CustomTextFormField(
                          labelText: 'Enter Date of Birth',
                          controller: birthDateController,
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: ColorPalette.primaryColor,
                          ),
                          keyboardType: TextInputType.text,
                          isEnable: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your date of birth";
                            }
                            return null;
                          },
                        ),
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
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const Gap(10),
                      CustomTextFormField(
                        labelText: 'Enter Email',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
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
