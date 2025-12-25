import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
import 'package:medpal/features/bootstrap/presentation/cubit/bootstrap_cubit.dart';
import 'package:medpal/features/bootstrap/presentation/cubit/bootstrap_presentation_events.dart';

class BootstrapPage extends StatelessWidget {
  const BootstrapPage({super.key});

  @override
  Widget build(BuildContext context) => MPPage<BootstrapCubit, void, BootstrapPresentationEvent>(
    onPresentationEvent: (context, event) {
      switch (event) {
        case FirstLaunchEvent():
          context.goRoute(MPRoute.welcome);
        case UserSignedInEvent():
          context.goRoute(MPRoute.home);
        case UserNotSignedInEvent():
          context.goRoute(MPRoute.signUp);
      }
    },
    builder: (context, cubit, _) => const Scaffold(),
  );
}
