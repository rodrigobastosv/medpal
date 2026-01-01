import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/appointment/data/appointment_repository.dart';
import 'package:medpal/features/appointment/domain/entities/appointment.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/patient/domain/errors/patient_error.dart';

class GetAppointmentsUseCase {
  GetAppointmentsUseCase({required AuthRepository authRepository, required AppointmentRepository appointmentRepository})
    : _authRepository = authRepository,
      _appointmentRepository = appointmentRepository;

  final AuthRepository _authRepository;
  final AppointmentRepository _appointmentRepository;

  Result<PatientError, Stream<List<Appointment>>> call() {
    final user = _authRepository.getUser();
    return switch (user) {
      GuestUser() => Error(PatientError()),
      AuthenticatedUser() => Success(_appointmentRepository.getAppointments(userId: user.userId)),
    };
  }
}
