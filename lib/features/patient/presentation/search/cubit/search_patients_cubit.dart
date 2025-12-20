import 'package:bloc/bloc.dart';
import 'package:medpal/features/patient/domain/use_cases/get_patients_use_case.dart';
import 'package:medpal/features/patient/presentation/search/cubit/search_patients_state.dart';

class SearchPatientsCubit extends Cubit<SearchPatientsState> {
  SearchPatientsCubit({required GetPatientsUseCase getPatientsUseCase})
    : _getPatientsUseCase = getPatientsUseCase,
      super(SearchPatientsState.initial());

  final GetPatientsUseCase _getPatientsUseCase;

  void getPatients() {
    final patientsResult = _getPatientsUseCase();
    patientsResult.when((error) {}, (patientsStream) {
      patientsStream.listen((patients) {});
    });
  }
}
