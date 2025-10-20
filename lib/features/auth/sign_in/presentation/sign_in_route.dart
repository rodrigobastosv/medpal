import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/auth/sign_in/presentation/sign_in_page.dart';

final signInRoute = GoRoute(
  path: MPRoute.signIn.path,
  builder: (context, state) => const SignInPage(),
  redirect: (context, state) => MPRoute.signIn.path,
);
