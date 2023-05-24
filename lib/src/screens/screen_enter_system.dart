import 'package:duty_manager/src/screens/screen_privacy_policies.dart';
import 'package:duty_manager/src/screens/screen_terms_of_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markup_text/flutter_markup_text.dart';
import 'package:go_router/go_router.dart';

import '/app_png.dart' as png;
import '/app_string.dart' as string;
import '/constraints.dart' as size;
import 'forms/form_entering_system.dart';

class ScreenEnterSystem extends StatefulWidget {
  static const String path = '/e';
  const ScreenEnterSystem({super.key});

  @override
  State<ScreenEnterSystem> createState() => _ScreenEnterSystemState();
}

class _ScreenEnterSystemState extends State<ScreenEnterSystem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final logoPic = Image.asset(
      png.logo,
      color: theme.scaffoldBackgroundColor,
      width: 150,
    );
    final appName = Text(
      string.appName,
      style: theme.textTheme.headlineSmall!.copyWith(
        color: theme.scaffoldBackgroundColor,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.5,
      ),
    );

    final isSmallScreen = size.isSmallSize(context);
    var header = Flexible(
        flex: isSmallScreen ? 2 : 3,
        child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(isSmallScreen ? 0 : 360),
              topRight: Radius.circular(isSmallScreen ? 0 : 100),
              bottomLeft: Radius.circular(isSmallScreen ? 90 : 0),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [logoPic, appName],
              ),
            ),
          ),
        ));
    var body = Flexible(
        flex: 3,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  string.authTitle,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 500,
                  margin: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    string.authGuidance,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const FormEnteringSystem(),
                Container(
                  //   alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 40, bottom: 5),
                  child: MarkupText(
                    marksStyle: TextStyle(color: theme.primaryColor),
                    text:
                        "By starting the application, you agree to the @{terms of service} and @{privacy policies} .",
                    marks: [
                      Mark(
                        'terms of service',
                        () => context.push(ScreenTermsOfService.path),
                      ),
                      Mark(
                        'privacy policies',
                        () {
                          context.push(ScreenPrivacyPolicies.path);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
    return Scaffold(
      body: Flex(
        direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
        children: [header, body],
      ),
    );
  }
}
