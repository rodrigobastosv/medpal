import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patient_card.dart';

class PatientsList extends StatelessWidget {
  const PatientsList(this.patients, {super.key});

  final List<Patient> patients;

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingMD, vertical: MPUiConstants.spacingSM),
        child: PatientCard(patients[index]),
      ),
      childCount: patients.length,
    ),
  );
}
