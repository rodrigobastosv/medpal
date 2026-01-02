import 'package:json_annotation/json_annotation.dart';
import 'package:medpal/core/data/converters/timestamp_date_time_converter.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';

part 'calendar_appointment.g.dart';

@JsonSerializable()
class CalendarAppointment {
  CalendarAppointment({
    required this.userId,
    required this.appointmentId,
    required this.patientId,
    required this.patientName,
    required this.type,
    required this.appointmentDate,
  });

  factory CalendarAppointment.fromJson(Map<String, dynamic> json) => _$CalendarAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarAppointmentToJson(this);

  final String userId;
  final String appointmentId;
  final String patientId;
  final String patientName;
  final AppointmentType type;
  @TimestampDateTimeConverter()
  final DateTime appointmentDate;
}
