import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/comment_card.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/facilities_chip.dart';
import 'package:share_plus/share_plus.dart';

class ProfileCommentsPage extends StatefulWidget {
  const ProfileCommentsPage({super.key});

  @override
  State<ProfileCommentsPage> createState() => _ProfileCommentsPageState();
}

class _ProfileCommentsPageState extends State<ProfileCommentsPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(243, 240, 255, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  )),
              child: Column(
                children: [
                  const Gap(20),
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
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Share.share(
                            'Check out John on PawPlaces: https://pawplaces.app/Dashboard?commentProfile=101',
                            subject: "Check out John on PawPlaces",
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/share.svg",
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          size: 27,
                        ),
                      ),
                      const Gap(15),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      const Gap(30),
                      SizedBox(
                        height: 70,
                        child: Image.asset("assets/images/Jhon.png"),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "John M.",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          const Gap(5),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          child: SvgPicture.asset(
                                              "assets/icons/paw.svg"),
                                        ),
                                        const Gap(5),
                                        const Text(
                                          "100+",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Total reviews",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ColorPalette.secondaryText,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  width: 20,
                                  thickness: 1,
                                  color: Colors.black.withOpacity(.5),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "45",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "Favorites",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ColorPalette.secondaryText,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(20),
                  Row(
                    children: [
                      Gap(15),
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Gap(5),
                      Text(
                        "(80% are Pet-Friendly)",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FacilitiesChip(
                          label: "Indoor",
                          count: 520,
                        ),
                        FacilitiesChip(
                          label: "Outdoor",
                          count: 753,
                        ),
                        FacilitiesChip(
                          label: "Both",
                          count: 1272,
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  CommentCard(),
                  Gap(15),
                  CommentCard(),
                  Gap(15),
                  CommentCard(),
                  Gap(15),
                  CommentCard(),
                  Gap(15),
                  CommentCard(),
                  Gap(15),
                  CommentCard(),
                  Gap(15),
                  CommentCard(),
                  Gap(15),
                  CommentCard(),
                  Gap(15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
