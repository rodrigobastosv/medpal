import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/l10n/l10n.dart';

class PatientBasicInformation extends StatelessWidget {
  const PatientBasicInformation(this.patient, {super.key});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(patient.name, style: textTheme.titleMedium),
        Text(l10n.patientAgeGender(patient.age, patient.gender.label(l10n)), style: textTheme.bodySmall),
        Text(l10n.patientLastVisit(DateTime.now().toString()), style: textTheme.bodySmall?.copyWith(color: context.colorScheme.outline)),
      ],
    );
  }
}
