import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/home/presentation/home_page.dart';

final homeRoute = GoRoute(name: MPRoute.home.name, path: MPRoute.home.path, builder: (context, state) => const HomePage());
