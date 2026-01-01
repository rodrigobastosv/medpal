import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/domain/enums/gender.dart';

class PatientFirebaseDatasource {
  PatientFirebaseDatasource({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  CollectionReference get usersCollection => _firebaseFirestore.collection('users');

  Future<Result<MPError, void>> registerPatient({
    required String userId,
    required String name,
    required DateTime dateOfBirth,
    required Gender gender,
    String? contactName,
    String? phoneNumber,
    String? notes,
  }) async {
    await usersCollection.doc(userId).collection('patients').add({
      'name': name,
      'dateOfBirth': dateOfBirth,
      'gender': gender.name,
      'contactName': contactName,
      'phoneNumber': phoneNumber,
      'notes': notes,
    });
    return const Success(null);
  }

  Stream<List<Patient>> getPatients({required String userId}) => usersCollection
      .doc(userId)
      .collection('patients')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Patient.fromJson({'id': doc.id, ...doc.data()})).toList());

  Future<Result<MPError, void>> deletePatient({required String userId, required String patientId}) async {
    await usersCollection.doc(userId).collection('patients').doc(patientId).delete();
    return const Success(null);
  }
}
