import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';

class PatientAvatar extends StatelessWidget {
  const PatientAvatar(this.patient, {super.key});

  final Patient patient;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: 24,
    backgroundColor: context.colorScheme.primary,
    child: Text(
      patient.initials,
      style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onPrimary, fontWeight: FontWeight.bold),
    ),
  );
}
