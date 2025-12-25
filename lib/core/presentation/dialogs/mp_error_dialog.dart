import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

Future<void> showErrorDialog(BuildContext context, {required String message, String? title}) {
  final l10n = context.l10n;
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: MPUiConstants.circularRadiusLG),
      insetPadding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingXL, vertical: MPUiConstants.spacingLG),
      child: Padding(
        padding: MPUiConstants.paddingLG,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? l10n.error,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.onSurface),
            ),
            MPUiConstants.gapM,
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
            ),
            MPUiConstants.gapLG,
            SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.ok.toUpperCase())),
            ),
          ],
        ),
      ),
    ),
  );
}
