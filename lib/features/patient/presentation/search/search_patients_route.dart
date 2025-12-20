import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/patient/presentation/search/cubit/search_patients_cubit.dart';
import 'package:medpal/features/patient/presentation/search/search_patients_page.dart';

final searchPatientsRoute = GoRoute(
  name: MPRoute.searchPatients.name,
  path: MPRoute.searchPatients.path,
  builder: (context, state) => BlocProvider<SearchPatientsCubit>(
    create: (context) => context.read<SearchPatientsCubit>()..getPatients(),
    child: const SearchPatientsPage(),
  ),
);
