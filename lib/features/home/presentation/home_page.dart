import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/features/home/presentation/widgets/add_patient_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: MPUiConstants.paddingHorizontal(16),
      child: SafeArea(
        child: Column(children: [AddPatientCard(onTap: () {})]),
      ),
    ),
  );
}
