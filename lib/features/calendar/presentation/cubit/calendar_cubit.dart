import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/calendar/domain/use_cases/get_calendar_appointments_use_case.dart';
import 'package:medpal/features/calendar/presentation/cubit/calendar_presentation_events.dart';
import 'package:medpal/features/calendar/presentation/cubit/calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> with BlocPresentationMixin<CalendarState, CalendarPresentationEvent> {
  CalendarCubit({required GetCalendarAppointmentsUseCase getCalendarAppointmentsUseCase})
    : _getCalendarAppointmentsUseCase = getCalendarAppointmentsUseCase,
      super(CalendarState.initial());

  final GetCalendarAppointmentsUseCase _getCalendarAppointmentsUseCase;

  void loadAppointments() {
    final appointmentsResult = _getCalendarAppointmentsUseCase();
    appointmentsResult.when(
      (error) {},
      (appointmentsStream) => appointmentsStream.listen((appointments) {
        emitPresentation(AppointmentsLoadedEvent(appointments));
        emit(state.copyWith(appointments: appointments));
      }),
    );
  }
}
