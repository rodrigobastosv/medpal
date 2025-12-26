import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/list_patients_route.dart';

class QuickActionsBottomBar extends StatelessWidget {
  const QuickActionsBottomBar({required this.patients, super.key});

  final List<Patient> patients;

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.transparent,
    height: 92,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _QuickAction(
          icon: Icons.search,
          label: 'Search',
          onTap: () => context.pushRoute(MPRoute.listPatients, extra: ListPatientsRouteExtra(patients: patients)),
        ),
        _QuickAction(icon: Icons.person_add, label: 'Add', onTap: () => context.pushRoute(MPRoute.registerPatient)),
        const _QuickAction(icon: Icons.calendar_today, label: 'Calendar'),
        const _QuickAction(icon: Icons.bar_chart, label: 'Reports'),
      ],
    ),
  );
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label, this.onTap});

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
