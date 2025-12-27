import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/features/home/presentation/widgets/stat_card.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';

class OverviewStats extends StatelessWidget {
  const OverviewStats({required this.patients, super.key});

  final List<Patient> patients;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(MPUiConstants.spacingMD, MPUiConstants.spacingMD, MPUiConstants.spacingMD, 0),
      child: Row(
        children: [
          StatCard(label: 'Patients', value: patients.length.toString()),
          const StatCard(label: 'Alerts', value: '2'),
          const StatCard(label: 'Today', value: '5'),
          const StatCard(label: 'Pending', value: '3'),
        ],
      ),
    ),
  );
}
