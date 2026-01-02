import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/appointment/data/appointment_repository.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/bootstrap/data/bootstrap_repository.dart';
import 'package:medpal/features/calendar/data/calendar_repository.dart';
import 'package:medpal/features/patient/data/patient_repository.dart';
import 'package:medpal/features/welcome/data/welcome_repository.dart';

List<RepositoryProvider> repositoryProviders() => [
  RepositoryProvider<BootstrapRepository>(create: (context) => BootstrapRepository(bootstrapLocalDatasource: context.read())),
  RepositoryProvider<WelcomeRepository>(create: (context) => WelcomeRepository(welcomeLocalDatasource: context.read())),
  RepositoryProvider<AuthRepository>(
    create: (context) => AuthRepository(authLocalDatasource: context.read(), authFirebaseDatasource: context.read()),
  ),
  RepositoryProvider<PatientRepository>(create: (context) => PatientRepository(patientFirebaseDatasource: context.read())),
  RepositoryProvider<AppointmentRepository>(create: (context) => AppointmentRepository(appointmentFirebaseDatasource: context.read())),
  RepositoryProvider<CalendarRepository>(create: (context) => CalendarRepository(calendarFirebaseDatasource: context.read())),
];
