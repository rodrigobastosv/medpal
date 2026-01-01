import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String message,
  required VoidCallback onConfirm,
  String? title,
  String? confirmLabel,
  String? cancelLabel,
}) async {
  final l10n = context.l10n;
  final result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: MPUiConstants.circularRadiusLG),
      insetPadding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingXL, vertical: MPUiConstants.spacingLG),
      child: Padding(
        padding: MPUiConstants.paddingLG,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? l10n.dialogDefaultTitle,
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
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: context.colorScheme.onPrimary,
                      foregroundColor: context.colorScheme.onError,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      cancelLabel ?? l10n.cancel,
                      style: DefaultTextStyle.of(context).style.copyWith(color: context.colorScheme.primary),
                    ),
                  ),
                ),
                MPUiConstants.gapM,
                Expanded(
                  child: FilledButton(onPressed: onConfirm, child: Text(confirmLabel ?? l10n.confirm)),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  return result ?? false;
}
