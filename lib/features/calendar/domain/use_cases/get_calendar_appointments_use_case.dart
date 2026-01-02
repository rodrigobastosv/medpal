import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/error/mp_unknown_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/calendar/data/calendar_repository.dart';
import 'package:medpal/features/calendar/domain/entities/calendar_appointment.dart';

class GetCalendarAppointmentsUseCase {
  GetCalendarAppointmentsUseCase({required AuthRepository authRepository, required CalendarRepository calendarRepository})
    : _authRepository = authRepository,
      _calendarRepository = calendarRepository;

  final AuthRepository _authRepository;
  final CalendarRepository _calendarRepository;

  Result<MPError, Stream<List<CalendarAppointment>>> call() {
    final user = _authRepository.getUser();
    return switch (user) {
      GuestUser() => Error(MPUnknownError()),
      AuthenticatedUser() => Success(_calendarRepository.getCalendarAppointments(userId: user.userId)),
    };
  }
}
