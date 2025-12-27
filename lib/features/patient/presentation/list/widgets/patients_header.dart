import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/l10n/l10n.dart';

class PatientsHeader extends StatelessWidget {
  const PatientsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingMD, vertical: MPUiConstants.spacingXS),
        child: Text(l10n.allPatients, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
