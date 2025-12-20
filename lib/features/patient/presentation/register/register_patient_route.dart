import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_cubit.dart';
import 'package:medpal/features/patient/presentation/register/register_patient_page.dart';

final registerPatientRoute = GoRoute(
  name: MPRoute.registerPatient.name,
  path: MPRoute.registerPatient.path,
  builder: (context, state) => BlocProvider<RegisterPatientCubit>(create: (context) => context.read(), child: const RegisterPatientPage()),
);
