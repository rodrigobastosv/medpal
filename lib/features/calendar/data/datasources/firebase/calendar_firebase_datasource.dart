import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medpal/features/calendar/domain/entities/calendar_appointment.dart';

class CalendarFirebaseDatasource {
  CalendarFirebaseDatasource({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  CollectionReference get calendarCollection => _firebaseFirestore.collection('calendar');

  Stream<List<CalendarAppointment>> getCalendarAppointments({required String userId}) => calendarCollection
      .doc(userId)
      .collection('appointments')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => CalendarAppointment.fromJson({'appointmentId': doc.id, ...doc.data()})).toList());
}
