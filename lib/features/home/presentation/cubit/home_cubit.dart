import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:medpal/features/home/presentation/cubit/home_presentation_events.dart';
import 'package:medpal/features/home/presentation/cubit/home_state.dart';
import 'package:medpal/features/patient/domain/use_cases/get_patients_use_case.dart';

class HomeCubit extends Cubit<HomeState> with BlocPresentationMixin<HomeState, HomePresentationEvent> {
  HomeCubit({required GetUserUseCase getUserUseCase, required GetPatientsUseCase getPatientsUseCase})
    : _getPatientsUseCase = getPatientsUseCase,
      super(HomeState.initial(user: getUserUseCase() as AuthenticatedUser));

  final GetPatientsUseCase _getPatientsUseCase;

  void loadPatients() {
    final patientsResult = _getPatientsUseCase();
    patientsResult.when(
      (error) {},
      (patientsStream) => patientsStream.listen((patients) {
        emit(state.copyWith(patients: patients));
      }),
    );
  }
}
