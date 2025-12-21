import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/auth/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:medpal/features/bootstrap/presentation/cubit/bootstrap_cubit.dart';
import 'package:medpal/features/home/presentation/cubit/home_cubit.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_cubit.dart';
import 'package:medpal/features/patient/presentation/search/cubit/search_patients_cubit.dart';
import 'package:medpal/features/welcome/presentation/welcome_cubit.dart';

List<RepositoryProvider> cubitProviders() => [
  RepositoryProvider<BootstrapCubit>(
    create: (context) => BootstrapCubit(isFirstLaunchUseCase: context.read(), getUserUseCase: context.read()),
  ),
  RepositoryProvider<WelcomeCubit>(create: (context) => WelcomeCubit(setFirstLaunchUseCase: context.read())),
  RepositoryProvider<SignUpCubit>(
    create: (context) => SignUpCubit(cameraService: context.read(), signUpUseCase: context.read()),
  ),
  RepositoryProvider<SignInCubit>(create: (context) => SignInCubit(signInUseCase: context.read())),
  RepositoryProvider<HomeCubit>(create: (context) => HomeCubit(getUserUseCase: context.read())),
  RepositoryProvider<RegisterPatientCubit>(create: (context) => RegisterPatientCubit(registerPatientUseCase: context.read())),
  RepositoryProvider<SearchPatientsCubit>(create: (context) => SearchPatientsCubit(getPatientsUseCase: context.read())),
];
