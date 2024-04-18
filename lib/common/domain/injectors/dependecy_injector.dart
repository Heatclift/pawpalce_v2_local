import 'package:get_it/get_it.dart';
import 'package:pawplaces/common/domain/services/location_service.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/dashboard_store.dart';
import 'package:pawplaces/features/dashboard/presentation/stores/favorites_store.dart';
import 'package:pawplaces/features/login/presentation/stores/authentication_store.dart';
import 'package:pawplaces/features/place_details/presentation/stores/place_reviews_store.dart';
import 'package:pawplaces/features/place_details/presentation/stores/review_store.dart';
import 'package:pawplaces/features/profile/presentation/stores/profile_store.dart';

final dpLocator = GetIt.instance;

void initInjector() {
  dpLocator.registerLazySingleton(() => LocationService());
  dpLocator.registerLazySingleton(() => DashboardStore());
  dpLocator.registerLazySingleton(() => FavoritesStore());
  dpLocator.registerLazySingleton(() => AuthenticationStore());
  dpLocator.registerLazySingleton(() => ProfileStore());
  dpLocator.registerLazySingleton(() => ReviewStore());
  dpLocator.registerLazySingleton(() => PlaceReviewsStore());

  dpLocator.registerLazySingleton(() => SessionStore());
}
