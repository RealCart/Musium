import 'package:go_router/go_router.dart';
import 'package:musium/core/constants/app_constants.dart';
import 'package:musium/core/data/sources/local/shared_storage.dart';
import 'package:musium/core/presentation/screens/on_boarding_screen.dart';
import 'package:musium/core/router/app_routes.dart';

class AppRouter {
  AppRouter(this._sharedStorage);

  final SharedStorage _sharedStorage;

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.onBoarding.path,
    routes: [
      GoRoute(
        path: AppRoutes.onBoarding.path,
        name: AppRoutes.onBoarding.name,
        builder:(context, state) => const OnBoardingScreen(),
      ),
    ],
    redirect: (context, state) {
      final bool hasSeenOnBoarding = _sharedStorage.readBool(AppConstants.onBoardingKey);

      if (state.path == AppRoutes.onBoarding.path && hasSeenOnBoarding) {
        return AppRoutes.home.path;
      }

      return null;
    },
  );
}