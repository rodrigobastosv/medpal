import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/patient/data/datasources/firebase/patient_firebase_datasource.dart';

class PatientRepository {
  PatientRepository({required PatientFirebaseDatasource patientFirebaseDatasource})
    : _patientFirebaseDatasource = patientFirebaseDatasource;

  final PatientFirebaseDatasource _patientFirebaseDatasource;

  Future<Result<MPError, void>> registerPatient({required String userId, required String name}) =>
      _patientFirebaseDatasource.registerPatient(userId: userId, name: name);

  Stream getPatients({required String userId}) => _patientFirebaseDatasource.getPatients(userId: userId);
}
