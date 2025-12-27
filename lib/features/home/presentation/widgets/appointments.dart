import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

class Appointments extends StatelessWidget {
  const Appointments({required this.onTapSchedule, super.key});

  final VoidCallback onTapSchedule;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = context.colorScheme;
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          MPUiConstants.spacingMD,
          MPUiConstants.spacingM,
          MPUiConstants.spacingMD,
          MPUiConstants.spacingXS,
        ),
        padding: const EdgeInsets.all(MPUiConstants.spacingMD),
        decoration: BoxDecoration(color: colorScheme.primary, borderRadius: MPUiConstants.circularRadiusLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today_outlined, color: colorScheme.onPrimary),
                MPUiConstants.gapSM,
                Text(l10n.appointments, style: context.textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary)),
              ],
            ),
            MPUiConstants.gapMD,
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(colorScheme.onPrimary)),
                    onPressed: onTapSchedule,
                    child: Text(
                      l10n.scheduleAppointment,
                      style: context.textTheme.bodyMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
