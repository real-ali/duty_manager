import 'package:device_preview/device_preview.dart';
import 'package:duty_manager/app_router.dart';
import 'package:duty_manager/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DutyManager extends StatelessWidget {
  const DutyManager({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.build(
      initialLocation: '/',
      routes: AppRoutes.routes,
    );
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
