import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/patient/presentation/search/cubit/search_patients_cubit.dart';
import 'package:medpal/features/patient/presentation/search/cubit/search_patients_state.dart';

class SearchPatientsPage extends StatelessWidget {
  const SearchPatientsPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchPatientsCubit, SearchPatientsState>(builder: (context, state) => const Scaffold(body: Column()));
}
