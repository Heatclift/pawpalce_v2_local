import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pawplaces/common/domain/constants/color_palette.dart';
import 'package:pawplaces/common/domain/helpers/hive_helper.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/routes/main_router.dart';
import 'package:pawplaces/common/domain/services/background_service.dart';
import 'package:pawplaces/common/domain/services/location_service.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initInjector();
  initFirebaseServices();

  Hive.initFlutter();
  HiveHelper.registerAdapters();
  BackgroundService.initPlatformState();

  dpLocator<LocationService>().getLocation();
  await dpLocator<SessionStore>().initSession();

  runApp(const MyApp());
}

Future<void> initFirebaseServices() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setDefaults({
    "distanceInterval": 20.00,
    "showAuthErrorDetails": true,
    "enableTestCrash": false,
  });

  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ),
  );

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await FirebaseMessaging.instance.requestPermission(provisional: true);
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider:
        kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );

  await FirebaseRemoteConfig.instance.setDefaults({
    "distanceInterval": 20.00,
    "showAuthErrorDetails": true,
    "enableTestCrash": true,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawPlaces',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PawPlaces'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final router = MainRouter.router();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var currentTheme = Theme.of(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp.router(
      title: "PawPlaces",
      theme: currentTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorPalette.primaryColor,
          primary: ColorPalette.primaryColorDark,
        ),
      ),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
