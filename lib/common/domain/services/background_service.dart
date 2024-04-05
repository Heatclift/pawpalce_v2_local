// ignore_for_file: avoid_print

import 'package:background_fetch/background_fetch.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/services/location_service.dart';

class BackgroundService {
  // Platform messages are asynchronous, so we initialize in an async method.
  static Future<void> initPlatformState() async {
    // Configure BackgroundFetch.

    int status = await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 1,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        startOnBoot: true,
        requiredNetworkType: NetworkType.ANY,
      ),
      _onBackgroundFetch,
    );
    print('[BackgroundFetch] configure success: $status');

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  static void _onBackgroundFetch(String taskId) {
    print("[BackgroundFetch] Event received $taskId");
    dpLocator<LocationService>().getLocation();
    // IMPORTANT:  You must signal completion of your task or the OS can punish your app
    // for taking too long in the background.

    BackgroundFetch.finish(taskId);
  }
}
