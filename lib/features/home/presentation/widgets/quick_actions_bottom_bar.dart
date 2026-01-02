import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
import 'package:medpal/features/home/presentation/widgets/quick_action.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/list_patients_route.dart';
import 'package:medpal/l10n/l10n.dart';

class QuickActionsBottomBar extends StatelessWidget {
  const QuickActionsBottomBar({required this.patients, super.key});

  final List<Patient> patients;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      color: Colors.transparent,
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingMD, vertical: MPUiConstants.spacingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuickAction(
            icon: Icons.search,
            label: l10n.search,
            onTap: () => context.pushRoute(MPRoute.listPatients, extra: ListPatientsRouteExtra(patients: patients)),
          ),
          QuickAction(icon: Icons.person_add, label: l10n.add, onTap: () => context.pushRoute(MPRoute.registerPatient)),
          QuickAction(icon: Icons.calendar_today, label: l10n.calendar, onTap: () => context.pushRoute(MPRoute.calendar)),
          QuickAction(icon: Icons.bar_chart, label: l10n.reports),
        ],
      ),
    );
  }
}
