import 'package:go_router/go_router.dart';
import 'package:pawplaces/features/choose_country/choose_country_screen.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_explorer_explainer/explorer_badge_dialog_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_mapper_explainer/mapper_badge_dialog_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/favorites_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_reviewer_explainer/reviewer_badge_dialog_screen.dart';
import 'package:pawplaces/features/dashboard/presentation/widget/paw_sharer_explainer/sharer_badge_dialog_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_city_leaderboard_screen.dart';
import 'package:pawplaces/features/leaderboards/presentation/screens/paw_country_leaderboard_screen.dart';
import 'package:pawplaces/features/login/presentation/screens/login_with_phone_screen.dart';
import 'package:pawplaces/features/login/presentation/screens/verify_otp_screen.dart';
import 'package:pawplaces/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pawplaces/features/otp/presentation/screens/reset_password_screen.dart';
import 'package:pawplaces/features/place_details/data/models/review_model.dart';
import 'package:pawplaces/features/place_details/presentation/screens/review_screen.dart';
import 'package:pawplaces/features/profile/data/models/pet_profile.dart';
import 'package:pawplaces/features/profile/presentation/screens/add_pet_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/edit_pet_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/edit_profile_info.dart';
import 'package:pawplaces/features/profile/presentation/screens/pet_details_screen.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_discovered.dart';
import 'package:pawplaces/features/profile/presentation/screens/places_visited.dart';
import 'package:pawplaces/features/register/presentation/screens/register_screen.dart';
import 'package:pawplaces/features/setting_page/presentation/screens/settings_screen.dart';
import 'package:pawplaces/features/splash/presentation/screens/splash_screen.dart';

class MainRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: SplashScreen.route,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: SplashScreen.route,
          name: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: OnboardingScreen.route,
          name: OnboardingScreen.routeName,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: MapperBadgeDialogScreen.route,
          name: MapperBadgeDialogScreen.routeName,
          builder: (context, state) => const MapperBadgeDialogScreen(),
        ),
        GoRoute(
          path: ExplorerBadgeDialogScreen.route,
          name: ExplorerBadgeDialogScreen.routeName,
          builder: (context, state) => const ExplorerBadgeDialogScreen(),
        ),
        GoRoute(
          path: ReviewerReviewerBadgeDialogScreen.route,
          name: ReviewerReviewerBadgeDialogScreen.routeName,
          builder: (context, state) =>
              const ReviewerReviewerBadgeDialogScreen(),
        ),
        GoRoute(
          path: SharerSharerBadgeDialogScreen.route,
          name: SharerSharerBadgeDialogScreen.routeName,
          builder: (context, state) => const SharerSharerBadgeDialogScreen(),
        ),
        GoRoute(
          path: ChooseCountry.route,
          name: ChooseCountry.routeName,
          builder: (context, state) => const ChooseCountry(),
        ),
        GoRoute(
          path: Dashboard.route,
          name: Dashboard.routeName,
          builder: (context, state) => Dashboard(
            params: state.uri.queryParameters,
          ),
          routes: [
            GoRoute(
              path: ReviewScreen.route,
              name: ReviewScreen.routeName,
              builder: (context, state) => ReviewScreen(
                review: state.uri.queryParameters["review"] as Review?,
                place: state.extra as PlaceModel,
              ),
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
              builder: (context, state) => PetDetailsScreen(
                petProfile: state.extra as PetProfile,
              ),
              routes: [
                GoRoute(
                  path: EditPetScreen.route,
                  name: EditPetScreen.routeName,
                  builder: (context, state) => EditPetScreen(
                    petProfile: state.extra as PetProfile,
                  ),
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
