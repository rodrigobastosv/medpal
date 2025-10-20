import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/welcome/presentation/welcome_cubit.dart';

List<RepositoryProvider> cubitProviders() => [
  RepositoryProvider<WelcomeCubit>(create: (context) => WelcomeCubit(setFirstLaunchUseCase: context.read())),
];
