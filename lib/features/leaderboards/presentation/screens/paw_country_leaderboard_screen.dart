import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intro/intro.dart';
import 'package:pawplaces/common/domain/helpers/math_helper.dart';
import 'package:pawplaces/features/leaderboards/presentation/widgets/country_list_item.dart';
import 'package:pawplaces/features/leaderboards/presentation/widgets/ranked_profile_list_item.dart';

class PawCountryLeaderBoards extends StatefulWidget {
  static String routeName = "PawCountryLeaderBoards";
  static String route = "PawCountryLeaderBoards";
  final bool isPageMode;
  final void Function()? onBack;
  final IntroController? introController;
  const PawCountryLeaderBoards(
      {super.key, this.isPageMode = false, this.onBack, this.introController});

  @override
  State<PawCountryLeaderBoards> createState() => _PawCountryLeaderBoardsState();
}

class _PawCountryLeaderBoardsState extends State<PawCountryLeaderBoards> {
  @override
  void initState() {
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
                  "Paw Country Leaderboard",
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
                      step: 9,
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
            const Gap(10),
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
