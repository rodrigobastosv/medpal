import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/bootstrap/presentation/cubit/bootstrap_cubit.dart';
import 'package:medpal/features/bootstrap/presentation/cubit/bootstrap_presentation_events.dart';

class BootstrapPage extends StatelessWidget {
  const BootstrapPage({super.key});

  @override
  Widget build(BuildContext context) => BlocPresentationListener<BootstrapCubit, BootstrapPresentationEvent>(
    listener: (context, event) {
      switch (event) {
        case FirstLaunchEvent():
          context.goNamed(MPRoute.welcome.name);
        case UserSignedInEvent():
          context.goNamed(MPRoute.home.name);
        case UserNotSignedInEvent():
          context.goNamed(MPRoute.signUp.name);
      }
    },
    child: BlocBuilder<BootstrapCubit, void>(builder: (context, state) => const Scaffold()),
  );
}
