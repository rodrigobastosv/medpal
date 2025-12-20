import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_cubit.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_state.dart';

class RegisterPatientPage extends StatelessWidget {
  const RegisterPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterPatientCubit>();
    return BlocBuilder<RegisterPatientCubit, RegisterPatientState>(
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: cubit.changeName,
            ),
            FilledButton(onPressed: state.isFormValid ? cubit.registerPatient : null, child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}
