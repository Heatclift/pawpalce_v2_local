import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
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
  final profileStore = dpLocator<ProfileStore>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController birthDateController;
  late TextEditingController sexController;

  @override
  void initState() {
    final user = profileStore.user;
    firstNameController = TextEditingController(text: user?.firstName);
    lastNameController = TextEditingController(text: user?.lastName);
    birthDateController = TextEditingController();
    sexController = TextEditingController();

    super.initState();
  }

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
                  "Edit info",
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
                      CroppedFile? croppedFile = await ImageCropper().cropImage(
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
                      var profilePic = store.profilePic;
                      bool hasPic = profilePic != null;
                      return AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: hasPic
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        File(store.profilePic!.path),
                                      ),
                                    )
                                  : Image.asset(
                                      "assets/icons/profilePicPlaceHolder.png",
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
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  const Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Date of Birth',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    controller: birthDateController,
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
                    "Sex",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  const Gap(10),
                  CustomTextFormField(
                    labelText: 'Enter Sex',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    controller: sexController,
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
