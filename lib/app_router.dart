import 'package:duty_manager/src/screens/screen_home.dart';
import 'package:duty_manager/src/screens/screen_privacy_policies.dart';
import 'package:duty_manager/src/screens/screen_sign_in.dart';
import 'package:duty_manager/src/screens/screen_task.dart';
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
    List<String> publicPaths = const [],
    List<String> loginPaths = const [],
  }) {
    return GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        ...routes,
      ],
      redirect: (_, state) {
        if (redirect != null) return redirect(state);
        bool isPublic = _publicPaths(publicPaths).any((e) => e == state.subloc);
        if (isPublic) return null;
        bool isLogin = _loginPaths(loginPaths).any((e) => e == state.subloc);
        if (!isSignedIn) return isLogin ? null : '/signIn';

        if (isSignedIn && isLogin) return '/';
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

  static List<String> _loginPaths(List<String> loginPaths) {
    return [
      '/signIn',
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
      path: SignInScreen.path,
      builder: (_, __) => const SignInScreen(),
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
      path: TaskScreen.path,
      builder: (_, __) => const TaskScreen(),
    )
  ];

  static const List<String> loginPaths = [];

  static const List<String> publicPaths = [
    ScreenPrivacyPolicies.path,
    ScreenTermsOfService.path,
  ];
}
