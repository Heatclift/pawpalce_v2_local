import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/place_details/presentation/screens/palce_details_screen.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/profile_comments_page.dart';
import 'package:pawplaces/features/profile/data/models/user_model.dart';

class DashboardModalTriggers {
  static void showprofileComments(BuildContext context, [UserModel? user]) {
    showDialog(
        context: context,
        barrierColor: const Color.fromRGBO(243, 240, 255, 1),
        builder: (context) => ProfileCommentsPage(
              user: user,
            ));
  }

  static void showpPlaceDetails(
      BuildContext context, PlaceModel place, LatLng? currentLoc) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return PlaceDetailsScreen(
            place: place,
            currentLoc: currentLoc,
          );
        });
  }
}
