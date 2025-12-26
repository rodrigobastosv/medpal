import 'package:medpal/features/patient/domain/entities/patient.dart';

class ListPatientsState {
  ListPatientsState({required this.patients});

  factory ListPatientsState.initial({required List<Patient> patients}) => ListPatientsState(patients: patients);

  final List<Patient> patients;
}
