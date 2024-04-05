import 'package:flutter/material.dart';
import 'package:pawplaces/features/place_details/presentation/screens/palce_details_screen.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/profile_comments_page.dart';

class DashboardModalTriggers {
  static void showprofileComments(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: const Color.fromRGBO(243, 240, 255, 1),
        builder: (context) => const ProfileCommentsPage());
  }

  static void showpPlaceDetails(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const PlaceDetailsScreen();
        });
  }
}
