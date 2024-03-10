import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:duty_manager/app_providers.dart';

import 'package:duty_manager/src/logic/logic_app.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kooza_flutter/kooza_flutter.dart';
import 'package:uuid/uuid.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult != ConnectivityResult.none) {
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'] ?? '',
      anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    );
  }
  await EasyLocalization.ensureInitialized();
  final kooza = await Kooza.getInstance("duty_manager");

  final repo = LogicApp(
    kooza: kooza,
    uuid: const Uuid(),
  );
  runApp(
    AppProviders(interfaceApp: repo),
  );
}
