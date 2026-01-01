import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/domain/use_cases/delete_patient_use_case.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_presentation_events.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_state.dart';

class ListPatientsCubit extends Cubit<ListPatientsState> with BlocPresentationMixin<ListPatientsState, ListPatientsPresentationEvent> {
  ListPatientsCubit({required List<Patient> patients, required DeletePatientUseCase deletePatientUseCase})
    : _deletePatientUseCase = deletePatientUseCase,
      super(ListPatientsState.initial(patients: patients));

  final DeletePatientUseCase _deletePatientUseCase;

  void changeSearchQuery(String? query) {
    emit(state.copyWith(searchQuery: query ?? ''));
  }

  Future<void> deletePatient(Patient patient) async {
    emitPresentation(ShowLoadingEvent());
    final deletePatientResult = await _deletePatientUseCase(patientId: patient.id);
    emitPresentation(HideLoadingEvent());

    deletePatientResult.when((error) => emitPresentation(ErrorEvent(errorMessage: error.errorMessage)), (_) {
      emit(state.copyWith(patients: state.patients.where((p) => p.id != patient.id).toList()));
    });
  }
}
