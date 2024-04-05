import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';

class ReviewScreen extends StatefulWidget {
  static String routeName = "ReviewScreen";
  static String route = "ReviewScreen";
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Review this pawshop",
                  style: TextStyle(
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
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorPalette.secondaryAccentColor,
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
                                    color: ColorPalette.secondaryText,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
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
                              child: Image.asset(
                                "assets/images/5pawRate.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      const Row(
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
                      const Gap(15),
                      const Row(
                        children: [
                          AreaChip(
                            title: 'Indoor',
                          ),
                          Gap(10),
                          AreaChip(
                            title: 'Outdoor',
                          ),
                          Gap(10),
                          AreaChip(
                            title: 'Both',
                          ),
                        ],
                      ),
                      const Gap(20),
                      const Row(
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
                      const Gap(15),
                      Row(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            strokeCap: StrokeCap.round,
                            dashPattern: const [5, 5],
                            padding: const EdgeInsets.all(15),
                            color: ColorPalette.accentText.withOpacity(.5),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(
                                "assets/icons/upload_button.png",
                                height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      const Row(
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
                      const Gap(15),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorPalette.accentText,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          minLines: 5,
                          maxLines: 10,
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
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
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
                      )
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
    return Chip(
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
          border: Border.all(
            color: ColorPalette.accentText,
            width: 1,
          ),
        ),
      ),
    );
  }
}
