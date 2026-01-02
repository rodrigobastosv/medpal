import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/calendar/presentation/calendar_page.dart';
import 'package:medpal/features/calendar/presentation/cubit/calendar_cubit.dart';

final calendarRoute = GoRoute(
  name: MPRoute.calendar.name,
  path: MPRoute.calendar.path,
  builder: (context, state) => BlocProvider<CalendarCubit>(
    create: (context) => CalendarCubit(getCalendarAppointmentsUseCase: context.read())..loadAppointments(),
    child: const CalendarPage(),
  ),
);
