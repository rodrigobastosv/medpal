import 'package:medpal/features/calendar/data/datasources/firebase/calendar_firebase_datasource.dart';
import 'package:medpal/features/calendar/domain/entities/calendar_appointment.dart';

class CalendarRepository {
  CalendarRepository({required CalendarFirebaseDatasource calendarFirebaseDatasource})
    : _calendarFirebaseDatasource = calendarFirebaseDatasource;

  final CalendarFirebaseDatasource _calendarFirebaseDatasource;

  Stream<List<CalendarAppointment>> getCalendarAppointments({required String userId}) =>
      _calendarFirebaseDatasource.getCalendarAppointments(userId: userId);
}
