import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({required this.icon, required this.label, super.key, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: colorScheme.primary, size: 22),
          ),
          const SizedBox(height: 8),
          Text(label, style: context.textTheme.bodySmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
