import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intro/intro.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/helpers/math_helper.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/achievement_unlocked_dialog.dart';
import 'package:pawplaces/features/leaderboards/presentation/widgets/country_list_item.dart';
import 'package:pawplaces/features/leaderboards/presentation/widgets/ranked_profile_list_item.dart';

class PawCityLeaderBoards extends StatefulWidget {
  static String routeName = "PawCityLeaderBoards";
  static String route = "PawCityLeaderBoards";
  final IntroController? introController;
  final bool isPageMode;
  final void Function()? onBack;

  const PawCityLeaderBoards(
      {super.key, this.isPageMode = false, this.onBack, this.introController});

  @override
  State<PawCityLeaderBoards> createState() => _PawCityLeaderBoardsState();
}

class _PawCityLeaderBoardsState extends State<PawCityLeaderBoards> {
  @override
  void initState() {
    CircleFlag.preload(['fr', 'us']);
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
                    if (widget.isPageMode) {
                      widget.onBack?.call();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 35,
                  ),
                ),
                const Text(
                  "Paw City Leaderboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 75,
              child: widget.introController != null
                  ? IntroStepTarget(
                      step: 11,
                      controller: widget.introController!,
                      cardDecoration: const IntroCardDecoration(
                          showPreviousButton: false,
                          showNextButton: true,
                          align: IntroCardAlign.outsideBottomLeft,
                          padding: EdgeInsets.only(
                            left: 20,
                          )),
                      cardContents: const TextSpan(
                        text: "Select rankings by country",
                      ),
                      child: _buildCountrySelector(),
                    )
                  : _buildCountrySelector(),
            ),
            SizedBox(
              height: 50,
              child: widget.introController != null
                  ? IntroStepTarget(
                      step: 12,
                      controller: widget.introController!,
                      cardDecoration: const IntroCardDecoration(
                          showPreviousButton: false,
                          showNextButton: true,
                          align: IntroCardAlign.outsideBottomLeft,
                          padding: EdgeInsets.only(
                            left: 20,
                          )),
                      onStepWillDeactivate: (willToStep) {
                        SessionService.markAsOnboarded();
                        showDialog(
                            context: context,
                            builder: (context) =>
                                const AchievementUnlockedDialog());
                      },
                      cardContents: const TextSpan(
                        text: "Select rankings by city",
                      ),
                      child: _buildCitySelector(),
                    )
                  : _buildCitySelector(),
            ),
            const Gap(5),
            RankedProfileListItem(
              rank: 1,
              photoUrl:
                  'https://i.pravatar.cc/${MathHelper.randomNumber(300, 400)}',
              xp: 1169,
              title: 'Park Young',
              subtitle: 'Quezon',
            ),
            RankedProfileListItem(
              rank: 2,
              photoUrl:
                  'https://i.pravatar.cc/${MathHelper.randomNumber(300, 400)}',
              xp: 1160,
              title: 'Tess Tieng',
              subtitle: 'Quezon',
            ),
            RankedProfileListItem(
              rank: 3,
              photoUrl:
                  'https://i.pravatar.cc/${MathHelper.randomNumber(300, 400)}',
              xp: 777,
              title: 'Lora Young',
              subtitle: 'Quezon',
            ),
            RankedProfileListItem(
              rank: 4,
              photoUrl:
                  'https://i.pravatar.cc/${MathHelper.randomNumber(300, 400)}',
              xp: 560,
              title: 'Xiao Mao',
              subtitle: 'Pampanga',
            ),
            RankedProfileListItem(
              rank: 5,
              photoUrl:
                  'https://i.pravatar.cc/${MathHelper.randomNumber(300, 400)}',
              xp: 555,
              title: 'Marcille Donato',
              subtitle: 'Manila',
            ),
            RankedProfileListItem(
              rank: 6,
              photoUrl:
                  'https://i.pravatar.cc/${MathHelper.randomNumber(300, 400)}',
              xp: 469,
              title: 'AJ Park',
              subtitle: 'Sarangani',
            ),
            const Gap(120),
          ],
        ),
      ),
    );
  }

  ListView _buildCitySelector() {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: const [
        CityChip(
          city: "Davao City",
          isSelected: true,
        ),
        Gap(10),
        CityChip(city: "Cebu City"),
        Gap(10),
        CityChip(city: "Quezon City"),
        Gap(10),
        CityChip(city: "Pasig"),
        Gap(10),
        CityChip(city: "Manila"),
        Gap(10),
      ],
    );
  }

  ListView _buildCountrySelector() {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: const [
        CountryListItem(
          country: "ph",
          isSelected: true,
        ),
        Gap(15),
        CountryListItem(
          country: "us",
        ),
        Gap(15),
        CountryListItem(
          country: "nz",
        ),
        Gap(15),
        CountryListItem(
          country: "gb",
        ),
        Gap(15),
        CountryListItem(
          country: "au",
        ),
        Gap(15),
        CountryListItem(
          country: "jp",
        ),
        Gap(15),
        CountryListItem(
          country: "sg",
        ),
        Gap(15),
        CountryListItem(
          country: "in",
        ),
        Gap(15),
      ],
    );
  }
}

class CityChip extends StatelessWidget {
  const CityChip({
    super.key,
    required this.city,
    this.isSelected = false,
  });

  final String city;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        city,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      backgroundColor: isSelected
          ? ColorPalette.primaryColor
          : ColorPalette.primaryColorFaint,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
