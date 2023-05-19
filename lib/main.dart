import 'package:device_preview/device_preview.dart';
import 'package:duty_manager/app_router.dart';
import 'package:duty_manager/src/logic/supabase/logic_supabase_authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kooza_flutter/kooza_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/controller/cubit/auth_cubit.dart';
import 'src/controller/cubit/auth_state.dart';
import 'src/logic/hive/logic_hive_authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localDb = await Kooza.getInstance("duty_manager");

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) {
      return DutyManager(
        boxCollection: localDb,
      );
    },
  ));
}

class DutyManager extends StatelessWidget {
  final Kooza boxCollection;
  const DutyManager({super.key, required this.boxCollection});

  void supabaseConfiguration() async {
    await Supabase.initialize(
      url: "https://pyioffutseemtyrvjzdp.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB5aW9mZnV0c2VlbXR5cnZqemRwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ0MDI4MDcsImV4cCI6MTk5OTk3ODgwN30.gKXIsuZL146UGEih9guvKK3QpoVWKSubSQIzPGzZlaE",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            options: LogicHiveAuthentication(boxCollection),
            supabaseAuthentication: LogicSupabaseAuthentication(
              supabaseConfiguration(),
            ),
          ),
        ),
      ],
      child: _buildApplication(context),
    );
  }

  Widget _buildApplication(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (_, state) {
        final router = AppRouter.build(
          initialLocation: '/',
          isSignedIn: state.isSignIn,
          routes: AppRoutes.routes,
          paths: AppRoutes.paths,
          loginPaths: AppRoutes.loginPaths,
          publicPaths: AppRoutes.publicPaths,
        );

        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          // useInheritedMediaQuery: true,
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
