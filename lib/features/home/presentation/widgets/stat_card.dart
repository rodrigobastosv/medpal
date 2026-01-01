import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';

class StatCard extends StatelessWidget {
  const StatCard({required this.label, required this.value, required this.onTap, super.key});

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Expanded(
    child: InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Text(value, style: context.textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(label, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    ),
  );
}
