import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/general/mp_loading.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_cubit.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_presentation_events.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_state.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patients_header.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patients_list.dart';
import 'package:medpal/features/patient/presentation/list/widgets/sticky_search_header.dart';
import 'package:medpal/l10n/l10n.dart';

class ListPatientsPage extends StatelessWidget {
  const ListPatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MPPage<ListPatientsCubit, ListPatientsState, ListPatientsPresentationEvent>(
      onPresentationEvent: (context, event) {
        switch (event) {
          case ShowLoadingEvent():
            context.showLoading();
          case HideLoadingEvent():
            context.hideLoading();
          case ErrorEvent():
            showErrorDialog(context, message: event.errorMessage);
        }
      },
      builder: (context, cubit, state) {
        final filteredPatients = state.sortedPatients
            .where((patient) => patient.name.toLowerCase().contains(state.searchQuery.toLowerCase()))
            .toList();

        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                StickySearchHeader(onChangeSearchQuery: cubit.changeSearchQuery),
                const PatientsHeader(),
                PatientsList(filteredPatients, onDeletePatient: cubit.deletePatient),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: context.colorScheme.primary,
            onPressed: () {},
            icon: Icon(Icons.person_add, color: context.colorScheme.onPrimary),
            label: Text(l10n.addPatient, style: TextStyle(color: context.colorScheme.onPrimary)),
          ),
        );
      },
    );
  }
}
