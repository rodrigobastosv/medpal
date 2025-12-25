import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';

class MPUserAvatar extends StatelessWidget {
  const MPUserAvatar({required this.user, required this.size, required this.onTapAvatar, super.key});

  final AuthenticatedUser user;
  final double size;
  final VoidCallback onTapAvatar;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTapAvatar,
    child: CircleAvatar(
      radius: size,
      backgroundColor: context.colorScheme.primary,
      backgroundImage: user.profilePhotoUrl != null ? NetworkImage(user.profilePhotoUrl!) : null,
      child: user.profilePhotoUrl == null
          ? Text(
              user.initials,
              style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onPrimary, fontWeight: FontWeight.bold),
            )
          : null,
    ),
  );
}
