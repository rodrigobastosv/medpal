import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:medpal/core/app/mp_provider.dart';
import 'package:medpal/core/routing/mp_router_config.dart';

class MPApp extends StatelessWidget {
  const MPApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'MedPal',
    debugShowCheckedModeBanner: false,
    builder: (context, child) => LoaderOverlay(child: MPProvider(child: child!)),
    routerConfig: mpRouterConfig,
  );
}
