import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

class ProfilePhotoPicker extends StatelessWidget {
  const ProfilePhotoPicker({super.key, this.onTap, this.image});

  final VoidCallback? onTap;
  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return InkWell(
      borderRadius: MPUiConstants.circularRadiusMD,
      onTap: onTap,
      child: Padding(
        padding: MPUiConstants.paddingVertical(MPUiConstants.spacingSM),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.primary.withValues(alpha: 0.2),
                image: image != null ? DecorationImage(image: MemoryImage(image!), fit: BoxFit.cover) : null,
              ),
              child: image == null ? Icon(Icons.camera_alt_outlined, color: context.colorScheme.onSurfaceVariant) : null,
            ),
            MPUiConstants.gapMD,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.addProfilePicture, style: context.textTheme.bodyMedium),
                Text(l10n.optional, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
