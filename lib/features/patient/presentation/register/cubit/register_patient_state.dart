import 'package:medpal/features/patient/domain/enums/gender.dart';

class RegisterPatientState {
  RegisterPatientState({required this.name, this.dateOfBirth, this.contactName, this.phoneNumber, this.gender, this.notes});

  factory RegisterPatientState.initial() => RegisterPatientState(name: '');

  final String name;
  final DateTime? dateOfBirth;
  final String? contactName;
  final String? phoneNumber;
  final Gender? gender;
  final String? notes;

  bool get isFormValid => name.isNotEmpty;

  RegisterPatientState copyWith({
    String? name,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? contactName,
    Gender? gender,
    String? notes,
  }) => RegisterPatientState(
    name: name ?? this.name,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    contactName: contactName ?? this.contactName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    gender: gender ?? this.gender,
    notes: notes ?? this.notes,
  );
}
