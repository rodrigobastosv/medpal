import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/auth/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:medpal/features/welcome/presentation/welcome_cubit.dart';

List<RepositoryProvider> cubitProviders() => [
  RepositoryProvider<WelcomeCubit>(create: (context) => WelcomeCubit(setFirstLaunchUseCase: context.read())),
  RepositoryProvider<SignUpCubit>(create: (context) => SignUpCubit(signUpUseCase: context.read())),
  RepositoryProvider<SignInCubit>(create: (context) => SignInCubit(signInUseCase: context.read())),
];
