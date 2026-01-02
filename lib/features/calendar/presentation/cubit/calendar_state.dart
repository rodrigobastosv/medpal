import 'package:medpal/features/calendar/domain/entities/calendar_appointment.dart';

class CalendarState {
  CalendarState({required this.appointments});

  factory CalendarState.initial() => CalendarState(appointments: []);

  final List<CalendarAppointment> appointments;

  CalendarState copyWith({List<CalendarAppointment>? appointments}) => CalendarState(appointments: appointments ?? this.appointments);
}
