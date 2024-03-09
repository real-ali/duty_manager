import 'package:device_preview/device_preview.dart';
import 'package:duty_manager/duty_manager.dart';

import 'package:duty_manager/src/controller/bloc_note.dart';
import 'package:duty_manager/src/controller/bloc_notes.dart';
import 'package:duty_manager/src/controller/bloc_task.dart';
import 'package:duty_manager/src/controller/bloc_tasks.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders extends StatelessWidget {
  final InterfaceApp _interface;
  const AppProviders({
    super.key,
    required InterfaceApp interfaceApp,
  }) : _interface = interfaceApp;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<InterfaceApp>(
      create: (context) => _interface,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TaskBloc(context.read<InterfaceApp>()),
          ),
          BlocProvider(
            create: (context) => TasksBloc(context.read<InterfaceApp>()),
          ),
          BlocProvider(
            create: (context) => NotesBloc(context.read<InterfaceApp>()),
          ),
          BlocProvider(
            create: (context) => NoteBloc(context.read<InterfaceApp>()),
          ),
        ],
        child: EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('fa', 'AF')],
          path: 'assets/locales',
          fallbackLocale: const Locale('en', 'US'),
          child: DevicePreview(
            enabled: !kReleaseMode,
            builder: (_) => const DutyManager(),
          ),
        ),
      ),
    );
  }
}
