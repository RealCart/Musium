import 'package:go_router/go_router.dart';
import 'package:musium/core/constants/app_constants.dart';
import 'package:musium/core/data/sources/local/shared_storage.dart';
import 'package:musium/core/presentation/screens/on_boarding_screen.dart';
import 'package:musium/core/presentation/widgets/bottom_navigation_widget.dart';
import 'package:musium/core/router/app_routes.dart';
import 'package:musium/features/explore/presentation/screen/explore_screen.dart';
import 'package:musium/features/home/presentation/screen/home_screen.dart';
import 'package:musium/features/library/presentation/screen/library_screen.dart';

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
        onExit: (context, state) {
          _sharedStorage.writeBool(AppConstants.onBoardingKey, true);
          return true;
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationWidget(
            currentIndex: navigationShell.currentIndex,
            onPressed: navigationShell.goBranch,
            selectedTab: navigationShell
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home.path,
                name: AppRoutes.home.name,
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.explore.path,
                name: AppRoutes.explore.name,
                builder: (context, state) {
                  return const ExploreScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.library.path,
                name: AppRoutes.library.name,
                builder: (context, state) {
                  return const LibraryScreen();
                },
              ),
            ],
          ),
        ],
      )
    ],
    // redirect: (context, state) {
    //   final bool hasSeenOnBoarding = _sharedStorage.readBool(AppConstants.onBoardingKey);

    //   if (state.fullPath == AppRoutes.onBoarding.path && hasSeenOnBoarding) {
    //     return AppRoutes.home.path;
    //   }

    //   return null;
    // },
  );
}