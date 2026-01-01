import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
import 'package:medpal/features/appointment/domain/entities/appointment.dart';
import 'package:medpal/features/home/presentation/widgets/stat_card.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/list_patients_route.dart';
import 'package:medpal/l10n/l10n.dart';

class OverviewStats extends StatelessWidget {
  const OverviewStats({required this.patients, required this.appointments, super.key});

  final List<Patient> patients;
  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(MPUiConstants.spacingMD, MPUiConstants.spacingMD, MPUiConstants.spacingMD, 0),
        child: Row(
          children: [
            StatCard(
              label: l10n.patient(patients.length),
              value: patients.length.toString(),
              onTap: () => context.pushRoute(MPRoute.listPatients, extra: ListPatientsRouteExtra(patients: patients)),
            ),
            StatCard(label: l10n.appointments(appointments.length), value: appointments.length.toString(), onTap: () {}),
            StatCard(label: l10n.pending, value: '3', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
