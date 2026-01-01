import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_cubit.dart';
import 'package:medpal/features/patient/presentation/list/list_patients_page.dart';

class ListPatientsRouteExtra {
  ListPatientsRouteExtra({required this.patients});

  final List<Patient> patients;
}

final listPatientsRoute = GoRoute(
  name: MPRoute.listPatients.name,
  path: MPRoute.listPatients.path,
  builder: (context, state) {
    final extra = state.extra as ListPatientsRouteExtra?;
    return BlocProvider<ListPatientsCubit>(
      create: (context) => ListPatientsCubit(patients: extra?.patients ?? [], deletePatientUseCase: context.read()),
      child: const ListPatientsPage(),
    );
  },
);
