import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/appointment/data/datasources/firebase/appointment_firebase_datasource.dart';
import 'package:medpal/features/auth/data/datasources/firebase/auth_firebase_datasource.dart';
import 'package:medpal/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:medpal/features/bootstrap/data/datasources/local/bootstrap_local_datasource.dart';
import 'package:medpal/features/calendar/data/datasources/firebase/calendar_firebase_datasource.dart';
import 'package:medpal/features/patient/data/datasources/firebase/patient_firebase_datasource.dart';
import 'package:medpal/features/welcome/data/datasources/local/welcome_local_datasource.dart';

List<RepositoryProvider> datasourceProviders() => [
  RepositoryProvider<BootstrapLocalDatasource>(create: (context) => BootstrapLocalDatasource(localStorageService: context.read())),
  RepositoryProvider<WelcomeLocalDatasource>(create: (context) => WelcomeLocalDatasource(localStorageService: context.read())),
  RepositoryProvider<AuthLocalDatasource>(create: (context) => AuthLocalDatasource(localStorageService: context.read())),
  RepositoryProvider<AuthFirebaseDatasource>(
    create: (context) =>
        AuthFirebaseDatasource(firebaseAuth: context.read(), firebaseFirestore: context.read(), firebaseStorage: context.read()),
  ),
  RepositoryProvider<PatientFirebaseDatasource>(create: (context) => PatientFirebaseDatasource(firebaseFirestore: context.read())),
  RepositoryProvider<AppointmentFirebaseDatasource>(create: (context) => AppointmentFirebaseDatasource(firebaseFirestore: context.read())),
  RepositoryProvider<CalendarFirebaseDatasource>(create: (context) => CalendarFirebaseDatasource(firebaseFirestore: context.read())),
];
