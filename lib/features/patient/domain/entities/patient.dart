import 'package:json_annotation/json_annotation.dart';
import 'package:medpal/core/data/converters/timestamp_date_time_converter.dart';
import 'package:medpal/features/patient/domain/enums/gender.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  Patient({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.gender,
    required this.notes,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  final String id;
  final String name;
  @TimestampDateTimeConverter()
  final DateTime dateOfBirth;
  final String? phoneNumber;
  final Gender gender;
  final String notes;
}
