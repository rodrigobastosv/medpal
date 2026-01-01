import 'package:flutter/material.dart';
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/appointment/data/datasources/firebase/appointment_firebase_datasource.dart';
import 'package:medpal/features/appointment/domain/entities/appointment.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';

class AppointmentRepository {
  AppointmentRepository({required AppointmentFirebaseDatasource appointmentFirebaseDatasource})
    : _appointmentFirebaseDatasource = appointmentFirebaseDatasource;

  final AppointmentFirebaseDatasource _appointmentFirebaseDatasource;

  Future<Result<MPError, void>> createAppointment({
    required String userId,
    required String patientId,
    required String patientName,
    required DateTime date,
    required TimeOfDay time,
    required AppointmentType type,
    String? notes,
  }) => _appointmentFirebaseDatasource.createAppointment(
    userId: userId,
    patientId: patientId,
    patientName: patientName,
    date: date,
    time: time,
    type: type,
    notes: notes,
  );

  Stream<List<Appointment>> getAppointments({required String userId}) => _appointmentFirebaseDatasource.getAppointments(userId: userId);
}
