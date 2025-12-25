import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/patient/data/datasources/firebase/patient_firebase_datasource.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/domain/enums/gender.dart';

class PatientRepository {
  PatientRepository({required PatientFirebaseDatasource patientFirebaseDatasource})
    : _patientFirebaseDatasource = patientFirebaseDatasource;

  final PatientFirebaseDatasource _patientFirebaseDatasource;

  Future<Result<MPError, void>> registerPatient({
    required String userId,
    required String name,
    required DateTime dateOfBirth,
    required Gender gender,
    required String notes,
  }) => _patientFirebaseDatasource.registerPatient(userId: userId, name: name, dateOfBirth: dateOfBirth, gender: gender, notes: notes);

  Stream<List<Patient>> getPatients({required String userId}) => _patientFirebaseDatasource.getPatients(userId: userId);
}
