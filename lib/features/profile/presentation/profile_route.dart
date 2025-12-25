import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:medpal/features/profile/presentation/profile_page.dart';

final profileRoute = GoRoute(
  name: MPRoute.profile.name,
  path: MPRoute.profile.path,
  builder: (context, state) => BlocProvider<ProfileCubit>(create: (context) => context.read<ProfileCubit>(), child: const ProfilePage()),
);
