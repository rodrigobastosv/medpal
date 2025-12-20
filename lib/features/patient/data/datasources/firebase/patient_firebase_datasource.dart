import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';

class PatientFirebaseDatasource {
  PatientFirebaseDatasource({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  CollectionReference get usersCollection => _firebaseFirestore.collection('users');

  Future<Result<MPError, void>> registerPatient({required String userId, required String name}) async {
    await usersCollection.doc(userId).collection('patients').add({'name': name});
    return const Success(null);
  }

  Stream getPatients({required String userId}) {
    final getPatientsResult = usersCollection.doc(userId).collection('patients').snapshots();
    return getPatientsResult;
  }
}
