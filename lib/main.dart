import 'package:device_preview/device_preview.dart';
import 'package:duty_manager/app_router.dart';
import 'package:duty_manager/src/logic/supabase/logic_supabase_authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kooza_flutter/kooza_flutter.dart';

import 'firebase_options.dart';
import 'src/controller/cubit/auth_cubit.dart';
import 'src/controller/cubit/auth_state.dart';
import 'src/logic/koozeh/logic_koozeh_authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final localDb = await Kooza.getInstance("duty_manager");

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) {
      return DutyManagerProviders(
        boxCollection: localDb,
      );
    },
  ));
}

class DutyManagerProviders extends StatelessWidget {
  final Kooza boxCollection;
  const DutyManagerProviders({super.key, required this.boxCollection});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            options: LogicKoozehAuthentication(boxCollection),
            onlineOptions: LogicSupabaseAuthentication(
                // supabaseConfiguration(),
                ),
          ),
        ),
      ],
      child: const DutyManager(),
    );
  }
}

class DutyManager extends StatelessWidget {
  const DutyManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) =>
          previous.isSignedIn != current.isSignedIn,
      builder: (context, state) {
        final router = AppRouter.build(
          initialLocation: '/',
          isSignedIn: state.isSignedIn,
          routes: AppRoutes.routes,
          paths: AppRoutes.paths,
          loginPaths: AppRoutes.loginPaths,
          publicPaths: AppRoutes.publicPaths,
        );
        return MaterialApp.router(
          routerConfig: router,
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
