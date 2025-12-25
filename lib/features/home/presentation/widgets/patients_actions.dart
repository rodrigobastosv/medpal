import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';

class PatientsActions extends StatelessWidget {
  const PatientsActions({super.key});

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildListDelegate.fixed([
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 16, 0),
        child: Text('Patients requiring attention', style: context.textTheme.titleMedium),
      ),
      _PatientAlertTile(),
      _PatientAlertTile(),
      _PatientAlertTile(),
    ]),
  );
}

class _PatientAlertTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(),
        title: const Text('Maria Silva'),
        subtitle: const Text('High blood pressure'),
        trailing: Icon(Icons.warning_amber_rounded, color: context.colorScheme.error),
        onTap: () {},
      ),
    ),
  );
}
