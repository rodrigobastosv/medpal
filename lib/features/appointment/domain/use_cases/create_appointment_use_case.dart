import 'package:flutter/material.dart';
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/appointment/data/appointment_repository.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';

class CreateAppointmentUseCase {
  CreateAppointmentUseCase({required AuthRepository authRepository, required AppointmentRepository appointmentRepository})
    : _authRepository = authRepository,
      _appointmentRepository = appointmentRepository;

  final AuthRepository _authRepository;
  final AppointmentRepository _appointmentRepository;

  Future<Result<MPError, void>> call({
    required String patientId,
    required String patientName,
    required DateTime date,
    required TimeOfDay time,
    required AppointmentType type,
    String? notes,
  }) {
    final user = _authRepository.getUser();
    return switch (user) {
      GuestUser() => throw UnimplementedError(),
      AuthenticatedUser() => _appointmentRepository.createAppointment(
        userId: user.userId,
        patientId: patientId,
        patientName: patientName,
        date: date,
        time: time,
        type: type,
        notes: notes,
      ),
    };
  }
}
