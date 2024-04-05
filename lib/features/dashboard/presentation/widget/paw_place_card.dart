import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/helpers/maps_helper.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/presentation/dashboard_modal_triggers.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/place_unlocked_dialog.dart';
import 'package:pawplaces/features/login/presentation/screens/login_with_phone_screen.dart';
import 'package:pawplaces/features/place_details/presentation/screens/review_screen.dart';
import 'package:pawplaces/features/register/presentation/screens/register_screen.dart';
import 'package:pawplaces/main.dart';
// import 'package:pawplaces/features/login/presentation/login_screen.dart';

class PawPlaceCard extends StatelessWidget {
  const PawPlaceCard({
    super.key,
    required this.place,
    required this.currentLoc,
    required this.placeLoc,
  });

  final PlaceModel place;
  final LatLng? currentLoc;
  final ({double lat, double long}) placeLoc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        DashboardModalTriggers.showpPlaceDetails(context);
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 350,
          maxHeight: 126,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(.1),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 128 / 101,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  place.thumbnail,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    "https://loremflickr.com/128/101",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.placeName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1,
                      color: ColorPalette.primaryText,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    "${currentLoc != null ? MapsHelper.calculateDistance(currentLoc!, LatLng(placeLoc.lat, placeLoc.long)).toStringAsFixed(1) : '0'} km",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: ColorPalette.primaryText.withOpacity(.7),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      // router.goNamed(Login.routeName);
                      //

                      final hasSession = dpLocator<SessionStore>().hasSession;
                      final hasProfile = dpLocator<SessionStore>().hasProfile;
                      if (hasSession) {
                        if (hasProfile) {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return const PlaceUnlockedDialog();
                              });
                          router.goNamed(ReviewScreen.routeName);
                        } else {
                          context.goNamed(Register.routeName);
                        }
                      } else {
                        context.goNamed(LoginWithPhone.routeName);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: ColorPalette.primaryColorDark,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      minimumSize: const Size(110, 10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Unlock PawPlace",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Gap(5),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorPalette.borderColor,
                  width: 2,
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/book_mark.svg",
                height: 13,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
