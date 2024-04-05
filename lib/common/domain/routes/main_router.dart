import 'package:go_router/go_router.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/favorites_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_city_leaderboard_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_country_leaderboard_screen.dart';
import 'package:pawplaces/features/login/presentation/screens/login_with_phone_screen.dart';
import 'package:pawplaces/features/login/presentation/screens/verify_otp_screen.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pawplaces/features/otp/presentation/screens/reset_password_screen.dart';
import 'package:pawplaces/features/place_details/presentation/screens/review_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/add_pet_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/edit_pet_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/edit_profile_info.dart';
import 'package:pawplaces/features/profile/presentation/screens/pet_details_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_discovered.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_visited.dart';
import 'package:pawplaces/features/register/presentation/screens/register_screen.dart';
import 'package:pawplaces/features/setting_page/presentation/screens/settings_screen.dart';

class MainRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: dpLocator<SessionStore>().hasSession
          ? Dashboard.route
          : OnboardingScreen.route,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: OnboardingScreen.route,
          name: OnboardingScreen.routeName,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: Dashboard.route,
          name: Dashboard.routeName,
          builder: (context, state) => Dashboard(
            params: state.pathParameters,
          ),
          routes: [
            GoRoute(
              path: ReviewScreen.route,
              name: ReviewScreen.routeName,
              builder: (context, state) => const ReviewScreen(),
            ),
            GoRoute(
              path: PlacesVisited.route,
              name: PlacesVisited.routeName,
              builder: (context, state) => const PlacesVisited(),
            ),
            GoRoute(
              path: PlacesDiscovered.route,
              name: PlacesDiscovered.routeName,
              builder: (context, state) => const PlacesDiscovered(),
            ),
            GoRoute(
              path: FavoritesScreen.route,
              name: FavoritesScreen.routeName,
              builder: (context, state) => const FavoritesScreen(),
            ),
            GoRoute(
              path: AddPetScreen.route,
              name: AddPetScreen.routeName,
              builder: (context, state) => const AddPetScreen(),
            ),
            GoRoute(
              path: EditProfileInfoScreen.route,
              name: EditProfileInfoScreen.routeName,
              builder: (context, state) => const EditProfileInfoScreen(),
            ),
            GoRoute(
              path: SettingsScreen.route,
              name: SettingsScreen.routeName,
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: PetDetailsScreen.route,
              name: PetDetailsScreen.routeName,
              builder: (context, state) => const PetDetailsScreen(),
              routes: [
                GoRoute(
                  path: EditPetScreen.route,
                  name: EditPetScreen.routeName,
                  builder: (context, state) => const EditPetScreen(),
                ),
              ],
            ),
            GoRoute(
              path: PawCityLeaderBoards.route,
              name: PawCityLeaderBoards.routeName,
              builder: (context, state) => const PawCityLeaderBoards(),
            ),
            GoRoute(
              path: PawCountryLeaderBoards.route,
              name: PawCountryLeaderBoards.routeName,
              builder: (context, state) => const PawCountryLeaderBoards(),
            ),
          ],
        ),
        GoRoute(
          path: LoginWithPhone.route,
          name: LoginWithPhone.routeName,
          builder: (context, state) => const LoginWithPhone(),
          routes: [
            GoRoute(
              path: ResetPasswordScreen.route,
              name: ResetPasswordScreen.routeName,
              builder: (context, state) => const ResetPasswordScreen(),
            ),
            GoRoute(
              path: VerifyOTPScreen.route,
              name: VerifyOTPScreen.routeName,
              builder: (context, state) => const VerifyOTPScreen(),
            ),
            GoRoute(
              path: Register.route,
              name: Register.routeName,
              builder: (context, state) => const Register(),
            ),
          ],
        ),
      ],
    );
  }
}
