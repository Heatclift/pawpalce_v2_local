import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_explorer_explainer/explorer_badge_dialog1.dart';

class ExplorerBadgeDialogScreen extends StatefulWidget {
  static String routeName = "ExplorerExplorerBadgeDialogScreen";
  static String route = "/ExplorerExplorerBadgeDialogScreen";

  const ExplorerBadgeDialogScreen({super.key});

  @override
  State<ExplorerBadgeDialogScreen> createState() =>
      ExplorerExplorerBadgeDialogScreenState();
}

class ExplorerExplorerBadgeDialogScreenState
    extends State<ExplorerBadgeDialogScreen> {
  final PageController _pageController = PageController();
  // ignore: unused_field
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ColorPalette.primaryColor, // Dark violet background color
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          // Detect swipe down gesture
          if (details.delta.dy > 6) {
            Navigator.of(context).pop();
          }
        },
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                ExplorerBadgeDialog1(),
                // ExplorerBadgeDialog2(),
                // ExplorerBadgeDialog3(),
                // ExplorerBadgeDialog4(),
                // ExplorerBadgeDialog5(),
                // ExplorerBadgeDialog6(),
              ],
            ),
            Positioned(
              top: 60,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorPalette.primaryColorLight,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
