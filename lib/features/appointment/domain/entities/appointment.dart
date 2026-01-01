import 'package:json_annotation/json_annotation.dart';
import 'package:medpal/core/data/converters/timestamp_date_time_converter.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  Appointment({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.appointmentDate,
    required this.type,
    this.notes,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);

  final String id;
  final String patientId;
  final String patientName;
  @TimestampDateTimeConverter()
  final DateTime appointmentDate;
  final AppointmentType type;
  final String? notes;
}
