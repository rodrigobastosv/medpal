import 'package:medpal/features/calendar/domain/entities/calendar_appointment.dart';

abstract class CalendarPresentationEvent {}

class AppointmentsLoadedEvent extends CalendarPresentationEvent {
  AppointmentsLoadedEvent(this.appointments);

  final List<CalendarAppointment> appointments;
}
