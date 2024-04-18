import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar(
      {super.key, this.onRatingUpdate, this.value = 1, this.readOnly = false});

  final void Function(double)? onRatingUpdate;

  final double value;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: value,
      direction: Axis.horizontal,
      ignoreGestures: readOnly,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: SvgPicture.asset("assets/icons/rate_paw.svg"),
        empty: SvgPicture.asset("assets/icons/rate_paw_empty.svg"),
        half: SvgPicture.asset("assets/icons/rate_paw_half.svg"),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        onRatingUpdate?.call(rating);
      },
    );
  }
}
