import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/welcome/presentation/welcome_cubit.dart';
import 'package:medpal/features/welcome/presentation/welcome_page.dart';

final welcomeRoute = GoRoute(
  name: MPRoute.welcome.name,
  path: MPRoute.welcome.path,
  builder: (context, state) => BlocProvider<WelcomeCubit>(
    create: (context) => WelcomeCubit(setFirstLaunchUseCase: context.read()),
    child: const WelcomePage(),
  ),
);
