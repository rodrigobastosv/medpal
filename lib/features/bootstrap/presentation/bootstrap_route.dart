import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';

final bootstrapRoute = GoRoute(
  path: MPRoute.bootstrap.path,
  builder: (context, state) => const Scaffold(),
  redirect: (context, state) => MPRoute.signIn.path,
);
