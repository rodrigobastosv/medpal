import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/auth/presentation/sign_in/sign_in_route.dart';
import 'package:medpal/features/auth/presentation/sign_up/sign_up_route.dart';
import 'package:medpal/features/bootstrap/presentation/bootstrap_route.dart';
import 'package:medpal/features/home/presentation/home_route.dart';
import 'package:medpal/features/patient/presentation/register/register_patient_route.dart';
import 'package:medpal/features/welcome/presentation/welcome_route.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final mpRouterConfig = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: MPRoute.bootstrap.path,
  routes: [homeRoute, bootstrapRoute, welcomeRoute, signInRoute, signUpRoute, registerPatientRoute],
);
