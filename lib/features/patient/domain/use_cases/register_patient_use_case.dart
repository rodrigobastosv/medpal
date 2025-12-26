import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/patient/data/patient_repository.dart';
import 'package:medpal/features/patient/domain/enums/gender.dart';

class RegisterPatientUseCase {
  RegisterPatientUseCase({required AuthRepository authRepository, required PatientRepository patientRepository})
    : _authRepository = authRepository,
      _patientRepository = patientRepository;

  final AuthRepository _authRepository;
  final PatientRepository _patientRepository;

  Future<Result<MPError, void>> call({
    required String name,
    required DateTime dateOfBirth,
    required Gender gender,
    String? contactName,
    String? phoneNumber,
    String? notes,
  }) {
    final user = _authRepository.getUser();
    return switch (user) {
      GuestUser() => throw UnimplementedError(),
      AuthenticatedUser() => _patientRepository.registerPatient(
        userId: user.userId,
        name: name,
        dateOfBirth: dateOfBirth,
        gender: gender,
        contactName: contactName,
        phoneNumber: phoneNumber,
        notes: notes,
      ),
    };
  }
}
