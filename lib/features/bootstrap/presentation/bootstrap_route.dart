import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/bootstrap/presentation/bootstrap_page.dart';
import 'package:medpal/features/bootstrap/presentation/cubit/bootstrap_cubit.dart';

final bootstrapRoute = GoRoute(
  name: MPRoute.bootstrap.name,
  path: MPRoute.bootstrap.path,
  builder: (context, state) =>
      BlocProvider<BootstrapCubit>(create: (context) => context.read<BootstrapCubit>()..init(), child: const BootstrapPage()),
);
