import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/dialogs/mp_confirmation_dialog.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
import 'package:medpal/features/appointment/presentation/create/create_appointment_route.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patient_card.dart';
import 'package:medpal/l10n/l10n.dart';

class PatientsList extends StatelessWidget {
  const PatientsList(this.patients, {required this.onDeletePatient, super.key});

  final List<Patient> patients;
  final Future<void> Function(Patient) onDeletePatient;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final patient = patients[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingMD, vertical: MPUiConstants.spacingSM),
          child: PatientCard(
            patient: patient,
            onScheduleAppointment: () => context.pushRoute(
              MPRoute.createAppointment,
              extra: CreateAppointmentRouteExtra(patients: patients, pickedPatient: patient),
            ),
            onDeletePatient: () => showConfirmationDialog(
              context,
              message: l10n.deletePatientConfirmation,
              onConfirm: () {
                context.pop();
                onDeletePatient(patient);
              },
            ),
          ),
        );
      }, childCount: patients.length),
    );
  }
}
