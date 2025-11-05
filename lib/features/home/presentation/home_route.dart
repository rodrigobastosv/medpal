import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/home/presentation/cubit/home_cubit.dart';
import 'package:medpal/features/home/presentation/home_page.dart';

final homeRoute = GoRoute(
  name: MPRoute.home.name,
  path: MPRoute.home.path,
  builder: (context, state) => BlocProvider<HomeCubit>(create: (context) => context.read(), child: const HomePage()),
);
