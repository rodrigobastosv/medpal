import 'package:medpal/features/patient/domain/enums/gender.dart';

class RegisterPatientState {
  RegisterPatientState({required this.name, this.dateOfBirth, this.gender, this.notes});

  factory RegisterPatientState.initial() => RegisterPatientState(name: '');

  final String name;
  final DateTime? dateOfBirth;
  final Gender? gender;
  final String? notes;

  bool get isFormValid => name.isNotEmpty;

  RegisterPatientState copyWith({String? name, DateTime? dateOfBirth, Gender? gender, String? notes}) => RegisterPatientState(
    name: name ?? this.name,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    gender: gender ?? this.gender,
    notes: notes ?? this.notes,
  );
}
