import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_cubit.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_state.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patients_header.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patients_list.dart';
import 'package:medpal/features/patient/presentation/list/widgets/sticky_search_header.dart';

class ListPatientsPage extends StatelessWidget {
  const ListPatientsPage({super.key});

  @override
  Widget build(BuildContext context) => MPPage<ListPatientsCubit, ListPatientsState, void>(
    builder: (context, cubit, state) => Scaffold(
      body: SafeArea(child: CustomScrollView(slivers: [const StickySearchHeader(), const PatientsHeader(), PatientsList(state.patients)])),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.person_add),
        label: const Text('Add patient'),
      ),
    ),
  );
}
