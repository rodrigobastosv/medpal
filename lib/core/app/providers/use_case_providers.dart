import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/auth/domain/use_cases/get_user_auth_status_use_case.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:medpal/features/bootstrap/domain/is_first_launch_use_case.dart';
import 'package:medpal/features/welcome/domain/set_first_launch_use_case.dart';

List<RepositoryProvider> useCaseProviders() => [
  RepositoryProvider<GetUserAuthStatusUseCase>(create: (context) => GetUserAuthStatusUseCase(authRepository: context.read())),
  RepositoryProvider<IsFirstLaunchUseCase>(create: (context) => IsFirstLaunchUseCase(bootstrapRepository: context.read())),
  RepositoryProvider<SetFirstLaunchUseCase>(create: (context) => SetFirstLaunchUseCase(welcomeRepository: context.read())),
  RepositoryProvider<SignUpUseCase>(create: (context) => SignUpUseCase(authRepository: context.read())),
  RepositoryProvider<SignInUseCase>(create: (context) => SignInUseCase(authRepository: context.read())),
];
