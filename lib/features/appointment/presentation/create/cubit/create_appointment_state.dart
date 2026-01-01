import 'package:flutter/material.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';

class CreateAppointmentState {
  CreateAppointmentState({
    required this.patients,
    required this.pickedPatient,
    required this.canChangePatient,
    required this.pickedDate,
    required this.pickedTime,
    required this.type,
    required this.notes,
  });

  factory CreateAppointmentState.initial({required List<Patient> patients, Patient? pickedPatient}) => CreateAppointmentState(
    patients: patients,
    pickedPatient: pickedPatient,
    canChangePatient: pickedPatient == null,
    pickedDate: null,
    pickedTime: null,
    type: null,
    notes: null,
  );

  final List<Patient> patients;
  final Patient? pickedPatient;
  final bool canChangePatient;
  final DateTime? pickedDate;
  final TimeOfDay? pickedTime;
  final AppointmentType? type;
  final String? notes;

  CreateAppointmentState copyWith({
    List<Patient>? patients,
    Patient? pickedPatient,
    DateTime? pickedDate,
    TimeOfDay? pickedTime,
    AppointmentType? type,
    String? notes,
  }) => CreateAppointmentState(
    patients: patients ?? this.patients,
    pickedPatient: pickedPatient ?? this.pickedPatient,
    canChangePatient: canChangePatient,
    pickedDate: pickedDate ?? this.pickedDate,
    pickedTime: pickedTime ?? this.pickedTime,
    type: type ?? this.type,
    notes: notes ?? this.notes,
  );
}
