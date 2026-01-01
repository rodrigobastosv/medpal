import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/appointment/presentation/create/create_appointment_page.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_cubit.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';

class CreateAppointmentRouteExtra {
  CreateAppointmentRouteExtra({required this.patients, this.pickedPatient});

  final List<Patient> patients;
  final Patient? pickedPatient;
}

final createAppointmentRoute = GoRoute(
  name: MPRoute.createAppointment.name,
  path: MPRoute.createAppointment.path,
  builder: (context, state) {
    final extra = state.extra as CreateAppointmentRouteExtra?;
    final (patients, pickedPatient) = (extra?.patients ?? [], extra?.pickedPatient);
    return BlocProvider<CreateAppointmentCubit>(
      create: (context) =>
          CreateAppointmentCubit(patients: patients, pickedPatient: pickedPatient, createAppointmentUseCase: context.read()),
      child: const CreateAppointmentPage(),
    );
  },
);
