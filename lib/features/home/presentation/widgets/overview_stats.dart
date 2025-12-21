import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';

class OverviewStats extends StatelessWidget {
  const OverviewStats({super.key});

  @override
  Widget build(BuildContext context) => const SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          _StatCard(label: 'Patients', value: '24'),
          _StatCard(label: 'Alerts', value: '2'),
          _StatCard(label: 'Today', value: '5'),
          _StatCard(label: 'Pending', value: '3'),
        ],
      ),
    ),
  );
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Expanded(
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
  );
}
