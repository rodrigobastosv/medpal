import 'package:medpal/features/patient/domain/entities/patient.dart';

class ListPatientsState {
  ListPatientsState({required this.searchQuery, required this.patients});

  factory ListPatientsState.initial({required List<Patient> patients}) => ListPatientsState(searchQuery: '', patients: patients);

  final String searchQuery;
  final List<Patient> patients;

  List<Patient> get sortedPatients => patients..sort((a, b) => a.name.compareTo(b.name));

  ListPatientsState copyWith({String? searchQuery, List<Patient>? patients}) =>
      ListPatientsState(searchQuery: searchQuery ?? this.searchQuery, patients: patients ?? this.patients);
}
