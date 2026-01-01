import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patient_avatar.dart';
import 'package:medpal/features/patient/presentation/list/widgets/patient_basic_information.dart';
import 'package:medpal/l10n/l10n.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({required this.patient, required this.onScheduleAppointment, super.key});

  final Patient patient;
  final VoidCallback onScheduleAppointment;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: MPUiConstants.circularRadiusLG,
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: MPUiConstants.circularRadiusLG,
          boxShadow: [BoxShadow(blurRadius: 12, offset: const Offset(0, 4), color: Colors.black.withValues(alpha: 0.05))],
        ),
        child: Padding(
          padding: MPUiConstants.paddingMD,
          child: Row(
            children: [
              PatientAvatar(patient),
              MPUiConstants.gapM,
              Expanded(child: PatientBasicInformation(patient)),
              IconButton(
                style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact, shape: const StadiumBorder()),
                icon: const Icon(Icons.calendar_month, size: 26),
                onPressed: onScheduleAppointment,
                color: context.colorScheme.primary,
                tooltip: l10n.scheduleAppointment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
