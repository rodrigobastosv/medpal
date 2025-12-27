import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/l10n/l10n.dart';

class AddPatientButton extends StatelessWidget {
  const AddPatientButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: Padding(
        padding: MPUiConstants.paddingHorizontal(MPUiConstants.spacingMD),
        child: FilledButton.icon(
          onPressed: onTap,
          icon: const Icon(Icons.person_add),
          label: Text(l10n.addNewPatient),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(borderRadius: MPUiConstants.circularRadiusLG),
          ),
        ),
      ),
    );
  }
}
