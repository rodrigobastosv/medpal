import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/patient/domain/enums/gender.dart';
import 'package:medpal/features/patient/domain/use_cases/register_patient_use_case.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_presentation_events.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_state.dart';

class RegisterPatientCubit extends Cubit<RegisterPatientState>
    with BlocPresentationMixin<RegisterPatientState, RegisterPatientPresentationEvent> {
  RegisterPatientCubit({required RegisterPatientUseCase registerPatientUseCase})
    : _registerPatientUseCase = registerPatientUseCase,
      super(RegisterPatientState.initial());

  final RegisterPatientUseCase _registerPatientUseCase;

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeDateOfBirth(DateTime dateOfBirth) {
    emit(state.copyWith(dateOfBirth: dateOfBirth));
  }

  void changeGender(Gender? gender) {
    emit(state.copyWith(gender: gender));
  }

  void changeNotes(String notes) {
    emit(state.copyWith(notes: notes));
  }

  Future<void> registerPatient() async {
    emitPresentation(ShowLoadingEvent());
    final registerResult = await _registerPatientUseCase(
      name: state.name,
      dateOfBirth: state.dateOfBirth!,
      gender: state.gender!,
      notes: state.notes!,
    );
    emitPresentation(HideLoadingEvent());

    registerResult.when(
      (error) => emitPresentation(ErrorEvent(errorMessage: error.errorMessage)),
      (_) => emitPresentation(PatientRegisteredEvent()),
    );
  }
}
