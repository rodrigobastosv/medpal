import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_presentation_events.dart';
import 'package:medpal/features/patient/presentation/list/cubit/list_patients_state.dart';

class ListPatientsCubit extends Cubit<ListPatientsState> with BlocPresentationMixin<ListPatientsState, ListPatientsPresentationEvent> {
  ListPatientsCubit({required List<Patient> patients}) : super(ListPatientsState.initial(patients: patients));
}
