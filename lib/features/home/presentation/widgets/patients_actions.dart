import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

class PatientsActions extends StatelessWidget {
  const PatientsActions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Padding(
          padding: const EdgeInsets.fromLTRB(MPUiConstants.spacingLG, MPUiConstants.spacingSM, MPUiConstants.spacingMD, 0),
          child: Text(l10n.patientsRequiringAttention, style: context.textTheme.titleMedium),
        ),
        _PatientAlertTile(),
        _PatientAlertTile(),
        _PatientAlertTile(),
      ]),
    );
  }
}

class _PatientAlertTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
    padding: MPUiConstants.paddingHorizontal(MPUiConstants.spacingMD),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: MPUiConstants.circularRadiusMD),
      child: ListTile(
        leading: const CircleAvatar(),
        title: const Text('Maria Silva'),
        subtitle: const Text('High blood pressure'),
        trailing: Icon(Icons.warning_amber_rounded, color: context.colorScheme.error),
        onTap: () {},
      ),
    ),
  );
}
