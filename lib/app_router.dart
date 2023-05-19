import 'package:duty_manager/src/screens/screen_about_app.dart';
import 'package:duty_manager/src/screens/screen_enter_system.dart';
import 'package:duty_manager/src/screens/screen_home.dart';
import 'package:duty_manager/src/screens/screen_privacy_policies.dart';
import 'package:duty_manager/src/screens/screen_terms_of_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  const AppRouter._();

  static GoRouter build({
    required bool isSignedIn,
    List<GoRoute> routes = const [],
    String initialLocation = '/',
    String? Function(GoRouterState)? redirect,
    List<String> paths = const [],
    List<String> publicPaths = const [],
    List<String> loginPaths = const [],
  }) {
    return GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        ...routes,
      ],
      redirect: (_, state) {
        bool isOnPath = _paths(paths).any((e) => e == state.subloc);
        bool isOnPublicPath =
            _publicPaths(publicPaths).any((e) => e == state.subloc);

        bool isOnLoginPath =
            _loginPaths(loginPaths).any((e) => e == state.subloc);
        if (redirect != null) return redirect(state);
        if (isOnPublicPath) return null;
        if (!isSignedIn && isOnPublicPath) return null;
        if (isSignedIn && !isOnLoginPath) return '/';
        if (!isSignedIn && isOnLoginPath) return '/e';
        if (!isSignedIn && isOnPath) return null;

        return null;
      },
      errorBuilder: (context, r) => Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => context.go('/'),
            child: const Text('Not found'),
          ),
        ),
      ),
    );
  }

  static List<String> _paths(List<String> paths) {
    return [
      '/e',
      ...paths,
    ];
  }

  static List<String> _loginPaths(List<String> loginPaths) {
    return [
      ...loginPaths,
    ];
  }

  static List<String> _publicPaths(List<String> publicPaths) {
    return [
      ...publicPaths,
    ];
  }
}

abstract class AppRoutes {
  const AppRoutes._();

  static final List<GoRoute> routes = <GoRoute>[
    GoRoute(
      path: ScreenEnterSystem.path,
      builder: (_, __) => const ScreenEnterSystem(),
    ),
    GoRoute(
      path: ScreenPrivacyPolicies.path,
      builder: (_, __) => const ScreenPrivacyPolicies(),
    ),
    GoRoute(
      path: ScreenTermsOfService.path,
      builder: (_, __) => const ScreenTermsOfService(),
    ),
    GoRoute(
      path: HomeScreen.path,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: ScreenAboutApp.path,
      builder: (_, __) => const ScreenAboutApp(),
    ),
  ];

  static const List<String> paths = [
    ScreenEnterSystem.path,
  ];

  static const List<String> loginPaths = [
    HomeScreen.path,
  ];

  static const List<String> publicPaths = [
    ScreenPrivacyPolicies.path,
    ScreenTermsOfService.path,
    ScreenAboutApp.path,
  ];
}
