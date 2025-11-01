import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

Future<void> showErrorDialog(BuildContext context, {required String message, String? title}) {
  final l10n = context.l10n;
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? l10n.error,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.onSurface),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                style: FilledButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(l10n.ok.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
