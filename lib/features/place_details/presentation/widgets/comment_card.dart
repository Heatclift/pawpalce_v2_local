import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/helpers/maps_helper.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/widgets/rating_bar.dart';
import 'package:pawplaces/features/dashboard/presentation/dashboard_modal_triggers.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
import 'package:pawplaces/features/place_details/data/models/review_model.dart';

class CommentCard extends StatelessWidget {
  final dashboardStore = dpLocator<DashboardStore>();
  final bool showPlace;
  final bool isDialogMode;
  final Review review;

  CommentCard({
    super.key,
    this.showPlace = false,
    this.isDialogMode = false,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // DashboardModalTriggers.showprofileComments(
                  //     context, review.userId);
                },
                child: SizedBox(
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "${review.reviewerPhotoUrl}",
                      errorBuilder: (context, error, stackTrace) =>
                          Image.network(
                              "https://fakeimg.pl/60x60?text=No+Image"),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.reviewerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 12,
                        child: FittedBox(
                          child: CustomRatingBar(
                            value: review.rating,
                            readOnly: true,
                          ),
                        ),
                      ),
                      const Gap(5),
                      Text(
                        "● ${Jiffy.parseFromDateTime(review.createdAt).fromNow()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.accentText.withOpacity(.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // PopupMenuButton<String>(
              //   onSelected: (selected) {
              //     switch (selected) {
              //       case 'Edit':
              //         try {
              //           context.goNamed(ReviewScreen.routeName,
              //               extra: review.place,
              //               queryParameters: {"review": review});
              //         } catch (e) {
              //           Navigator.of(context).pop();
              //           context.goNamed(ReviewScreen.routeName,
              //               extra: review.place,
              //               queryParameters: {"review": review});
              //         }
              //       case 'Delete':
              //         break;
              //     }
              //   },
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15)),
              //   itemBuilder: (BuildContext context) {
              //     return {'Delete'}.map((String choice) {
              //       return PopupMenuItem<String>(
              //         height: 40,
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 15,
              //         ),
              //         value: choice,
              //         child: Text(
              //           choice,
              //           style: const TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       );
              //     }).toList();
              //   },
              //   child: Icon(
              //     Icons.more_horiz,
              //     color: ColorPalette.accentText,
              //   ),
              // )
            ],
          ),
          const Gap(10),
          if (review.place != null) ...[
            _buildPlaceCard(context),
            const Gap(10),
          ],
          Text(
            review.reviewDetails,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const Gap(10),
          if (review.reviewPhotos.isNotEmpty)
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...review.reviewPhotos.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     barrierColor: const Color.fromRGBO(24, 24, 24, 1),
                          //     builder: (context) => ImageViewDialog());
                        },
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              e.reviewPhotoUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                "assets/icons/logo_medium.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  GestureDetector _buildPlaceCard(BuildContext context) {
    final location = dashboardStore.currentLocation;
    final place = review.place;
    return GestureDetector(
      onTap: () {
        // if (isDialog) {
        //   Navigator.of(context).pop();
        // }
        ///todo: implement dependencies
        DashboardModalTriggers.showpPlaceDetails(
          context,
          place,
          LatLng(location.latitude, location.longitude),
        );
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 350,
          maxHeight: 50,
        ),
        padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(.1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 128 / 101,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  place!.thumbnail,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/icons/logo_medium.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Gap(15),
            Expanded(
              child: Text(
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
            ),
            Text(
              "${MapsHelper.calculateDistance(LatLng(location.latitude, location.longitude), LatLng(place.latitude, place.longitude)).toStringAsFixed(1)} km",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: ColorPalette.primaryText.withOpacity(.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
