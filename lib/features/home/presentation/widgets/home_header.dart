import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/l10n/l10n.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({required this.user, required this.onTapProfile, super.key});

  final AuthenticatedUser user;
  final VoidCallback onTapProfile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          MPUiConstants.spacingMD,
          MPUiConstants.spacingLG,
          MPUiConstants.spacingMD,
          MPUiConstants.spacingMD,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.greetings('Afternoon', user.name), style: context.textTheme.titleMedium),
                  MPUiConstants.gapXS,
                  Text(
                    l10n.patientsNeedAtention(3),
                    style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTapProfile,
              child: CircleAvatar(
                radius: MPUiConstants.radiusXL,
                backgroundColor: context.colorScheme.primary,
                backgroundImage: user.profilePhotoUrl != null ? NetworkImage(user.profilePhotoUrl!) : null,
                child: user.profilePhotoUrl == null
                    ? Text(
                        user.initials,
                        style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onPrimary, fontWeight: FontWeight.bold),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
