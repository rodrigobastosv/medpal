import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

class PatientsSearchCard extends StatelessWidget {
  const PatientsSearchCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: MPUiConstants.circularRadiusLG),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: MPUiConstants.paddingMD,
          child: Row(
            children: [
              const Icon(Icons.person_add_rounded, size: 28),
              MPUiConstants.gapMD,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Search', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                    MPUiConstants.gapXS,
                    Text(l10n.registerPatientProfile, style: context.textTheme.bodyMedium?.copyWith()),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
