import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:medpal/features/auth/presentation/sign_up/sign_up_page.dart';

final signUpRoute = GoRoute(
  name: MPRoute.signUp.name,
  path: MPRoute.signUp.path,
  builder: (context, state) => BlocProvider<SignUpCubit>(
    create: (context) => SignUpCubit(cameraService: context.read(), signUpUseCase: context.read()),
    child: const SignUpPage(),
  ),
  redirect: (context, state) => MPRoute.signUp.path,
);
