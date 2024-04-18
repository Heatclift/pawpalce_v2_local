import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/presentation/widgets/rating_bar.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/place_details/data/models/review_model.dart';
import 'package:pawplaces/features/place_details/presentation/stores/review_store.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/review_success_dialog.dart';

class ReviewScreen extends StatefulWidget {
  static String routeName = "ReviewScreen";
  static String route = "ReviewScreen";
  final PlaceModel place;
  final Review? review;
  const ReviewScreen({super.key, this.review, required this.place});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final store = ReviewStore();
  final commentController = TextEditingController();

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
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  widget.review != null
                      ? const Text(
                          "Edit this Review",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        )
                      : Text(
                          "Review ${widget.place.placeName}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                store.isNotPetFriendly =
                                    !store.isNotPetFriendly;
                              },
                              child: Observer(builder: (context) {
                                if (store.isLoading) {
                                  context.loaderOverlay.show();
                                } else {
                                  context.loaderOverlay.hide();
                                }
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: store.isNotPetFriendly
                                          ? ColorPalette.primaryColor
                                          : null,
                                      border: Border.all(
                                          color:
                                              ColorPalette.secondaryAccentColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      )),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        child: Image.asset(
                                          "assets/icons/dogIcon.png",
                                        ),
                                      ),
                                      const Gap(10),
                                      Text(
                                        "Not Pet-Friendly",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: store.isNotPetFriendly
                                              ? Colors.white
                                              : ColorPalette.secondaryText,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            const Gap(20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorPalette.secondaryAccentColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  )),
                              child: SizedBox(
                                height: 18,
                                child: FittedBox(
                                  child: Observer(builder: (context) {
                                    if (store.isNotPetFriendly) {
                                      store.reviewRating = 0;
                                    }
                                    return CustomRatingBar(
                                      readOnly: store.isNotPetFriendly,
                                      value: store.reviewRating,
                                      onRatingUpdate: (rating) {
                                        store.reviewRating = rating;
                                      },
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              "Areas available",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Observer(builder: (context) {
                          final val = store.areas;
                          if (store.isNotPetFriendly) {
                            store.areas = null;
                          }
                          return Row(
                            children: [
                              AreaChip(
                                title: 'Indoor',
                                value: val == "Indoor",
                                ontap: () {
                                  store.areas = "Indoor";
                                },
                              ),
                              const Gap(10),
                              AreaChip(
                                title: 'Outdoor',
                                value: val == "Outdoor",
                                ontap: () {
                                  store.areas = "Outdoor";
                                },
                              ),
                              const Gap(10),
                              AreaChip(
                                title: 'Both',
                                value: val == "Both",
                                ontap: () {
                                  store.areas = "Both";
                                },
                              ),
                            ],
                          );
                        }),
                      ),
                      const Gap(20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              "Add a photo or video",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const ClampingScrollPhysics(),
                          child: Observer(builder: (context) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Gap(25),
                                ...store.bittenReviewPhotos.map(
                                  (element) => Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      child: Image.memory(
                                        element,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                if (store.bittenReviewPhotos.length < 5)
                                  GestureDetector(
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();

                                      // ignore: unused_local_variable
                                      final XFile? image =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);

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
                                              toolbarColor:
                                                  ColorPalette.primaryColorDark,
                                              toolbarWidgetColor: ColorPalette
                                                  .secondaryAccentColor,
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
                                              aspectRatioPickerButtonHidden:
                                                  true,
                                            ),
                                          ],
                                        );

                                        if (croppedFile != null) {
                                          await store.addPicture(
                                              XFile(croppedFile.path));
                                        }
                                      }
                                    },
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(12),
                                      strokeCap: StrokeCap.round,
                                      dashPattern: const [5, 5],
                                      padding: const EdgeInsets.all(15),
                                      color: ColorPalette.accentText
                                          .withOpacity(.5),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        child: Image.asset(
                                          "assets/icons/upload_button.png",
                                          height: 70,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                const Gap(25)
                              ],
                            );
                          }),
                        ),
                      ),
                      const Gap(20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              "Add a written review",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorPalette.accentText,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          minLines: 5,
                          maxLines: 10,
                          initialValue: widget.review?.reviewDetails,
                          controller: commentController,
                          decoration: InputDecoration(
                            hintText: "What did you like or dislike?",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: ColorPalette.secondaryText,
                            ),
                            fillColor: Colors.white,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const Gap(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  final res = await store.submitReview(
                                    reviewDetails: commentController.text,
                                    locationId: widget.place.placeId,
                                  );
                                  if (res) {
                                    if (mounted) {
                                      await showDialog(
                                        // ignore: use_build_context_synchronously
                                        context: context,
                                        builder: (context) =>
                                            ReviewSuccessDialog(
                                          place: widget.place,
                                        ),
                                      );
                                      // ignore: use_build_context_synchronously
                                      context.pop();
                                    }
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(255, 180, 0, 1),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  minimumSize: const Size(300, 50),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Submit Review',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            ColorPalette.primaryButtonTextColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AreaChip extends StatelessWidget {
  const AreaChip({
    super.key,
    required this.title,
    this.ontap,
    this.value = false,
  });

  final String title;

  final void Function()? ontap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Chip(
        label: Text(
          title,
          style: TextStyle(
            color: ColorPalette.accentText,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: ColorPalette.accentFaint,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide.none,
        ),
        avatar: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value ? ColorPalette.orange : null,
            border: Border.all(
              color: ColorPalette.accentText,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
