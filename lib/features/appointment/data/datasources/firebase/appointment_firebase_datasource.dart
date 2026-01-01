import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/appointment/domain/entities/appointment.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';

class AppointmentFirebaseDatasource {
  AppointmentFirebaseDatasource({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  CollectionReference get usersCollection => _firebaseFirestore.collection('users');

  Future<Result<MPError, void>> createAppointment({
    required String userId,
    required String patientId,
    required String patientName,
    required DateTime date,
    required TimeOfDay time,
    required AppointmentType type,
    String? notes,
  }) async {
    await usersCollection.doc(userId).collection('appointments').add({
      'patientId': patientId,
      'patientName': patientName,
      'appointmentDate': Timestamp.fromDate(DateTime(date.year, date.month, date.day, time.hour, time.minute)),
      'type': type.value,
      'notes': notes,
    });
    return const Success(null);
  }

  Stream<List<Appointment>> getAppointments({required String userId}) => usersCollection
      .doc(userId)
      .collection('appointments')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Appointment.fromJson({'id': doc.id, ...doc.data()})).toList());
}
