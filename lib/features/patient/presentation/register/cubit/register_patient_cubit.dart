import 'package:bloc/bloc.dart';
import 'package:medpal/features/patient/domain/use_cases/register_patient_use_case.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_state.dart';

class RegisterPatientCubit extends Cubit<RegisterPatientState> {
  RegisterPatientCubit({required RegisterPatientUseCase registerPatientUseCase})
    : _registerPatientUseCase = registerPatientUseCase,
      super(RegisterPatientState.initial());

  final RegisterPatientUseCase _registerPatientUseCase;

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  Future<void> registerPatient() async {
    await _registerPatientUseCase(name: state.name);
  }
}
