import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/auth/presentation/sign_in/sign_in_route.dart';
import 'package:medpal/features/bootstrap/presentation/bootstrap_route.dart';

final mpRouterConfig = GoRouter(initialLocation: MPRoute.bootstrap.path, routes: [bootstrapRoute, signInRoute]);
