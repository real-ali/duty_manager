import 'package:device_preview/device_preview.dart';
import 'package:duty_manager/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/controller/cubit/sign_in_cubit.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) {
      return const DutyManager();
    },
  ));
}

class DutyManager extends StatelessWidget {
  const DutyManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        )
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return _buildApplication(context);
        },
      ),
    );
  }

  Widget _buildApplication(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final router = AppRouter.build(
          initialLocation: state.isLacal ? '/tasks' : '/',
          isSignedIn: state.isSignIn,
          routes: AppRoutes.routes,
          loginPaths: AppRoutes.loginPaths,
          publicPaths: AppRoutes.publicPaths,
        );

        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: 'Lato',
              primaryColor: const Color(0xFF5184DB)),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Lato',
            primaryColor: const Color(0xFFD1CE10),
          ),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
