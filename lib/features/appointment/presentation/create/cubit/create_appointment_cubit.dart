import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_presentation_events.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState>
    with BlocPresentationMixin<CreateAppointmentState, CreateAppointmentPresentationEvent> {
  CreateAppointmentCubit() : super(CreateAppointmentState.initial());
}
