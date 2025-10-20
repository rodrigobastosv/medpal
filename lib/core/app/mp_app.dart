import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:medpal/core/app/providers/mp_provider.dart';
import 'package:medpal/core/presentation/mp_theme.dart';
import 'package:medpal/core/routing/mp_router_config.dart';
import 'package:medpal/l10n/arb/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MPApp extends StatelessWidget {
  const MPApp({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder<SharedPreferences>(
    future: SharedPreferences.getInstance(),
    builder: (context, snapshot) => snapshot.hasData
        ? MaterialApp.router(
            title: 'MedPal',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: MPTheme.lightTheme,
            builder: (context, child) => LoaderOverlay(
              child: MPProvider(prefs: snapshot.data!, child: child!),
            ),
            routerConfig: mpRouterConfig,
          )
        : const SizedBox.shrink(),
  );
}
