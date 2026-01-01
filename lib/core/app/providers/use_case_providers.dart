import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/appointment/domain/use_cases/create_appointment_use_case.dart';
import 'package:medpal/features/appointment/domain/use_cases/get_appointments_use_case.dart';
import 'package:medpal/features/auth/domain/use_cases/get_user_auth_status_use_case.dart';
import 'package:medpal/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:medpal/features/bootstrap/domain/is_first_launch_use_case.dart';
import 'package:medpal/features/patient/domain/use_cases/get_patients_use_case.dart';
import 'package:medpal/features/patient/domain/use_cases/register_patient_use_case.dart';
import 'package:medpal/features/profile/domain/use_cases/sign_out_use_case.dart';
import 'package:medpal/features/welcome/domain/set_first_launch_use_case.dart';

List<RepositoryProvider> useCaseProviders() => [
  RepositoryProvider<GetUserAuthStatusUseCase>(create: (context) => GetUserAuthStatusUseCase(authRepository: context.read())),
  RepositoryProvider<IsFirstLaunchUseCase>(create: (context) => IsFirstLaunchUseCase(bootstrapRepository: context.read())),
  RepositoryProvider<SetFirstLaunchUseCase>(create: (context) => SetFirstLaunchUseCase(welcomeRepository: context.read())),
  RepositoryProvider<SignUpUseCase>(create: (context) => SignUpUseCase(authRepository: context.read())),
  RepositoryProvider<SignInUseCase>(create: (context) => SignInUseCase(authRepository: context.read())),
  RepositoryProvider<SignOutUseCase>(create: (context) => SignOutUseCase(authRepository: context.read())),
  RepositoryProvider<GetUserUseCase>(create: (context) => GetUserUseCase(authRepository: context.read())),
  RepositoryProvider<RegisterPatientUseCase>(
    create: (context) => RegisterPatientUseCase(authRepository: context.read(), patientRepository: context.read()),
  ),
  RepositoryProvider<GetPatientsUseCase>(
    create: (context) => GetPatientsUseCase(authRepository: context.read(), patientRepository: context.read()),
  ),
  RepositoryProvider<CreateAppointmentUseCase>(
    create: (context) => CreateAppointmentUseCase(authRepository: context.read(), appointmentRepository: context.read()),
  ),
  RepositoryProvider<GetAppointmentsUseCase>(
    create: (context) => GetAppointmentsUseCase(authRepository: context.read(), appointmentRepository: context.read()),
  ),
];
