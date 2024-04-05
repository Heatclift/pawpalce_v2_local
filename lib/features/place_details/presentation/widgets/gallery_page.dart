import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/helpers/math_helper.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/image_view_dialog.dart';
import 'package:pawplaces/features/place_details/presentation/widgets/sort_button.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          const Row(
            children: [
              Gap(15),
              Text(
                "Featured image",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              SortButton(),
              Gap(15),
            ],
          ),
          const Gap(15),
          GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            shrinkWrap: true,
            children: List.generate(
              6,
              (index) => GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromRGBO(24, 24, 24, 1),
                      builder: (context) => ImageViewDialog());
                },
                child: SizedBox(
                  height: 100,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://loremflickr.com/400/40${MathHelper.randomNumber(1, 9)}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
          const Row(
            children: [
              Gap(15),
              Text(
                "121 Gallery",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              SortButton(),
              Gap(15),
            ],
          ),
          const Gap(15),
          GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            shrinkWrap: true,
            children: List.generate(
              10,
              (index) => SizedBox(
                height: 100,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://loremflickr.com/400/40${MathHelper.randomNumber(1, 9)}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
