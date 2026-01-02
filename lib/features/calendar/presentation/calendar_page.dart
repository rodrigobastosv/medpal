import 'package:flutter/material.dart';
import 'package:infinite_calendar_view/infinite_calendar_view.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/features/calendar/presentation/cubit/calendar_cubit.dart';
import 'package:medpal/features/calendar/presentation/cubit/calendar_presentation_events.dart';
import 'package:medpal/features/calendar/presentation/cubit/calendar_state.dart';
import 'package:medpal/l10n/l10n.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final EventsController _eventsController;

  @override
  void initState() {
    _eventsController = EventsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MPPage<CalendarCubit, CalendarState, CalendarPresentationEvent>(
      onPresentationEvent: (context, event) {
        switch (event) {
          case AppointmentsLoadedEvent():
            _eventsController.calendarData.addEvents(
              event.appointments.map((appointment) {
                final appointmentDate = appointment.appointmentDate;
                return Event(
                  title: '${appointment.type.label(l10n)} - ${appointment.patientName}',
                  color: appointment.type.color,
                  startTime: appointmentDate,
                  endTime: appointmentDate.add(const Duration(hours: 1)),
                );
              }).toList(),
            );
            _eventsController.notifyListeners();
        }
      },
      builder: (context, cubit, state) => Scaffold(
        body: SafeArea(child: EventsPlanner(controller: _eventsController, daysShowed: 1)),
      ),
    );
  }
}
