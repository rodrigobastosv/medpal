import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/welcome/presentation/welcome_page.dart';

final welcomeRoute = GoRoute(path: MPRoute.welcome.path, builder: (context, state) => const WelcomePage());
