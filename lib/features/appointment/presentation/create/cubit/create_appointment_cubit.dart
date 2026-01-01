import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';
import 'package:medpal/features/appointment/domain/use_cases/create_appointment_use_case.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_presentation_events.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_state.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState>
    with BlocPresentationMixin<CreateAppointmentState, CreateAppointmentPresentationEvent> {
  CreateAppointmentCubit({
    required List<Patient> patients,
    required CreateAppointmentUseCase createAppointmentUseCase,
    Patient? pickedPatient,
  }) : _createAppointmentUseCase = createAppointmentUseCase,
       super(CreateAppointmentState.initial(patients: patients, pickedPatient: pickedPatient));

  final CreateAppointmentUseCase _createAppointmentUseCase;

  void changePatient(Patient patient) => emit(state.copyWith(pickedPatient: patient));

  void changeDate(DateTime date) => emit(state.copyWith(pickedDate: date));

  void changeTime(TimeOfDay time) => emit(state.copyWith(pickedTime: time));

  void changeType(AppointmentType type) => emit(state.copyWith(type: type));

  void changeNotes(String notes) => emit(state.copyWith(notes: notes));

  Future<void> createAppointment() async {
    emitPresentation(ShowLoadingEvent());
    final createAppointmentResult = await _createAppointmentUseCase(
      patientId: state.pickedPatient!.id,
      patientName: state.pickedPatient!.name,
      date: state.pickedDate!,
      time: state.pickedTime!,
      type: state.type!,
      notes: state.notes,
    );
    emitPresentation(HideLoadingEvent());

    createAppointmentResult.when(
      (error) => emitPresentation(ErrorEvent(errorMessage: error.errorMessage)),
      (_) => emitPresentation(AppointmentCreatedEvent()),
    );
  }
}
