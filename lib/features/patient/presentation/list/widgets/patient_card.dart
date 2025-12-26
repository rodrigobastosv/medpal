import 'package:flutter/material.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patient_avatar.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patient_basic_information.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(this.patient, {super.key});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(blurRadius: 12, offset: const Offset(0, 4), color: Colors.black.withValues(alpha: 0.05))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              PatientAvatar(patient),
              const SizedBox(width: 16),
              Expanded(child: PatientBasicInformation(patient)),
            ],
          ),
        ),
      ),
    );
  }
}
