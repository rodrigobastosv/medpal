import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/appointment/presentation/create/create_appointment_page.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_cubit.dart';

final createAppointmentRoute = GoRoute(
  name: MPRoute.createAppointment.name,
  path: MPRoute.createAppointment.path,
  builder: (context, state) => BlocProvider<CreateAppointmentCubit>(
    create: (context) => context.read<CreateAppointmentCubit>(),
    child: const CreateAppointmentPage(),
  ),
);
