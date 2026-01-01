import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
import 'package:medpal/features/appointment/presentation/create/create_appointment_route.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patient_card.dart';

class PatientsList extends StatelessWidget {
  const PatientsList(this.patients, {super.key});

  final List<Patient> patients;

  @override
  Widget build(BuildContext context) => SliverList(
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
        ),
      );
    }, childCount: patients.length),
  );
}
