import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/patient/data/patient_repository.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/domain/errors/patient_error.dart';

class GetPatientsUseCase {
  GetPatientsUseCase({required AuthRepository authRepository, required PatientRepository patientRepository})
    : _authRepository = authRepository,
      _patientRepository = patientRepository;

  final AuthRepository _authRepository;
  final PatientRepository _patientRepository;

  Result<PatientError, Stream<List<Patient>>> call() {
    final user = _authRepository.getUser();
    return switch (user) {
      GuestUser() => Error(PatientError()),
      AuthenticatedUser() => Success(_patientRepository.getPatients(userId: user.userId)),
    };
  }
}
