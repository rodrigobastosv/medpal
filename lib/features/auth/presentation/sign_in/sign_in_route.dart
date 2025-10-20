import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/auth/presentation/sign_in/sign_in_page.dart';

final signInRoute = GoRoute(
  name: MPRoute.signIn.name,
  path: MPRoute.signIn.path,
  builder: (context, state) => const SignInPage(),
  redirect: (context, state) => MPRoute.signIn.path,
);
