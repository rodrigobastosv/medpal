import 'package:json_annotation/json_annotation.dart';
import 'package:medpal/features/patient/domain/enums/gender.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  Patient({required this.id, required this.name, required this.dateOfBirth, required this.gender, required this.notes});

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  final String id;
  final String name;
  final DateTime dateOfBirth;
  final Gender gender;
  final String notes;
}
