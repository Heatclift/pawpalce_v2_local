import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:pawplaces/common/domain/helpers/math_helper.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';

class FavoritesScreen extends StatefulWidget {
  static String routeName = "FavoritesScreen";
  static String route = "FavoritesScreen";
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final store = dpLocator<DashboardStore>();

  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.black, //
    //   statusBarBrightness: Brightness.light, // Dark text for status bar
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return Column(
          children: [
            const Gap(60),
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
                  "Favorites",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
              ],
            ),
            const Gap(15),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 155 / 195,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     barrierColor: const Color.fromRGBO(24, 24, 24, 1),
                      //     builder: (context) => ImageViewDialog());
                    },
                    child: SizedBox(
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://loremflickr.com/400/40${MathHelper.randomNumber(1, 9)}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Text(
                            "Java Junction",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          const Text(
                            "25 Places",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(50),
          ],
        );
      }),
    );
  }
}
