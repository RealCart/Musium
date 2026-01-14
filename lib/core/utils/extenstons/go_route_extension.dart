import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


typedef GoRouterExPageBuilder = Page<dynamic> Function(
    BuildContext context, GoRouterState state, Widget child,
  );


abstract interface class GoRouteWrapper {
  Widget wrppedRoute(BuildContext context);
}

extension GoRouteEx on GoRoute {
  static GoRoute wrappedRoute({
    required String path,
    required GoRouterWidgetBuilder wrappedBuilder,
    String? name,
    GoRouterExPageBuilder? pageBuilder,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
    FutureOr<bool> Function(BuildContext, GoRouterState)? onExit,
    bool caseSensitive = true,
    List<RouteBase> routes = const <RouteBase>[],
  }) {
    Widget buildChild(BuildContext context, GoRouterState state) {
      final Widget child = wrappedBuilder(context, state);

      if (child is GoRouteWrapper) {
        return (child as GoRouteWrapper).wrppedRoute(context);
      } else {
        return child;
      }
    }

    return GoRoute(
      path: path,
      name: name,
      builder: pageBuilder == null ? buildChild : null,
      pageBuilder: pageBuilder == null ? null : (context, state) {
        final child = buildChild(context, state);
        return pageBuilder(context, state, child);
      },
      parentNavigatorKey: parentNavigatorKey,
      redirect: redirect,
      onExit: onExit,
      caseSensitive: caseSensitive,
      routes: routes,
    );
  }
}