// ignore_for_file: unused_element, unused_local_variable

import 'dart:async';

import 'package:app_links/app_links.dart';

class ApplinksService {
  final _appLinks = AppLinks();
  StreamSubscription? subscription;

  Future<void> initApplinks() async {
    final initialUri = await _appLinks.getInitialAppLink();

    subscription = _appLinks.uriLinkStream.listen(
      (uri) {},
    );

    void handleUris(Uri uri) {
      var path = uri.path;
      var queryParams = uri.queryParameters;

      // if (queryParams.containsKey('profileReviews')) {
      //   router.goNamed(Dashboard.routeName);
      //   showDialog(context: router.configuration, builder: builder)
      // }
    }
  }
}
