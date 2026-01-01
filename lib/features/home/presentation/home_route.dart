import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/appointment/presentation/create/create_appointment_route.dart';
import 'package:medpal/features/home/presentation/cubit/home_cubit.dart';
import 'package:medpal/features/home/presentation/home_page.dart';
import 'package:medpal/features/patient/presentation/list/list_patients_route.dart';
import 'package:medpal/features/profile/presentation/profile_route.dart';

final homeRoute = GoRoute(
  name: MPRoute.home.name,
  path: MPRoute.home.path,
  builder: (context, state) => BlocProvider<HomeCubit>(
    create: (context) =>
        HomeCubit(getUserUseCase: context.read(), getPatientsUseCase: context.read(), getAppointmentsUseCase: context.read())
          ..loadPatients()
          ..loadAppointments(),
    child: const HomePage(),
  ),
  routes: [profileRoute, listPatientsRoute, createAppointmentRoute],
);
