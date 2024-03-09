import 'package:duty_manager/src/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  const AppRouter._();

  static GoRouter build({
    List<GoRoute> routes = const [],
    String initialLocation = '/',
  }) {
    return GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        ...routes,
      ],
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
}

abstract class AppRoutes {
  const AppRoutes._();

  static final List<GoRoute> routes = <GoRoute>[
    GoRoute(
      path: ScreenHome.path,
      builder: (_, __) => const ScreenHome(),
    ),
  ];
}
