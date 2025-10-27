import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/bootstrap/domain/is_first_launch_use_case.dart';

final bootstrapRoute = GoRoute(
  name: MPRoute.bootstrap.name,
  path: MPRoute.bootstrap.path,
  builder: (context, state) => const Scaffold(),
  redirect: (context, state) {
    final isFirstLaunchUseCase = context.read<IsFirstLaunchUseCase>();
    final isFirstLaunch = isFirstLaunchUseCase();
    if (isFirstLaunch) {
      return MPRoute.welcome.path;
    }
    return MPRoute.signUp.path;
  },
);
